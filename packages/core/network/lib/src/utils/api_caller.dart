import 'dart:async';

import 'package:dio/dio.dart';
import 'package:utils/utils.dart';

import '../../network.dart';

abstract class ApiCaller {
  /// Safely executes an API call and returns a [Result] wrapping the data with optional meta.
  /// This method handles all API errors and transforms them into appropriate [AppException] types.
  /// Returns [DataWithMeta] which contains both the response data and optional pagination metadata.
  static Future<Result<DataWithMeta<T>>> safeApiCallWithMeta<T>(
      Future<Response<NetworkResponse<T>>> Function() apiCall,
      ) async {
    try {
      final response = await apiCall();

      if (!_isSuccessStatus(response.statusCode)) {
        return Result.error(_handleHttpError(response));
      }

      final networkResponse = response.data;

      if (networkResponse == null || networkResponse.data == null) {
        return Result.error(
          const HttpException(code: 400, message: 'Response format malformed!'),
        );
      }

      if (networkResponse.status != 'success') {
        return Result.error(
          HttpException(
            code: response.statusCode,
            message: networkResponse.message ?? 'Server Error',
          ),
        );
      }

      // Return data wrapped with meta
      return Result.ok(
        DataWithMeta(
          data: networkResponse.data as T,
          meta: networkResponse.meta,
        ),
      );
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } catch (e) {
      _printError('Unexpected error: $e', 'safeApiCall - unknown error');
      return Result.error(
        const UnknownException(message: 'Unexpected error occurred'),
      );
    }
  }

  /// Simplified version of safeApiCall that only returns the data without meta.
  /// Useful for endpoints that don't return pagination metadata.
  static Future<Result<T>> safeApiCall<T>(
      Future<Response<NetworkResponse<T>>> Function() apiCall,
      ) async {
    final result = await safeApiCallWithMeta<T>(apiCall);
    return result.map((dataWithMeta) => dataWithMeta.data);
  }

  /// Checks if the HTTP status code is within the success range (200-299).
  static bool _isSuccessStatus(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  /// Handles Dio exceptions and maps them to custom AppExceptions.
  static AppException _handleDioError(DioException e) {
    _printError(
      'DioException: ${e.message} | Type: ${e.type} | Exception: $e',
      'safeApiCall - DioException',
    );

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(message: e.message ?? 'Request timed out');

      case DioExceptionType.badResponse:
        return _handleHttpError(e.response!);

      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      default:
        return NetworkException(
          message: e.message ?? 'Network error',
          code: e.response?.statusCode,
        );
    }
  }

  /// Handles HTTP error responses (both from DioException and status check failures).
  static AppException _handleHttpError(Response<dynamic> response) {
    _printError(
      'HTTP Error: ${response.statusCode} - ${response.statusMessage}',
      '_handleHttpError',
    );

    final errorResponse = _parseErrorResponse(response);

    if (errorResponse != null) {
      return HttpException(
        code: errorResponse.statusCode,
        message: errorResponse.message,
      );
    }

    return HttpException(
      code: response.statusCode,
      message: response.statusMessage ?? 'HTTP Error',
    );
  }

  /// Parses the error response body into an [ErrorResponse] if possible.
  static ErrorResponse? _parseErrorResponse(Response<dynamic> response) {
    try {
      final data = response.data;
      if (response.statusCode == 500) {
        return ErrorResponse(
          message: 'Server error occurred',
          error: 'Error from server',
          statusCode: 500,
        );
      }
      if (data is Map<String, dynamic>) {
        final errorResponse = ErrorResponse.fromJson(data);
        _printError(
          'error-response: ${errorResponse.toString()}',
          '_parseErrorResponse - details',
        );
        return errorResponse;
      }
    } catch (e) {
      _printError('Failed to parse ErrorResponse: $e', '_parseErrorResponse');
    }
    return null;
  }

  /// Logs errors with formatting for better console visibility.
  static void _printError(String message, String location) {
    final separator = '\x1B[31m' + ('═' * 80) + '\x1B[0m';
    final header = '\x1B[31mERROR [$location] \x1B[0m';
    final body = '\x1B[91m$message\x1B[0m';

    print(separator);
    print(header);
    print(body);
    print(separator);
  }
}

// result_extensions.dart
extension ResultExtensions<T> on Result<T> {
  Result<R> map<R>(R Function(T value) mapper) {
    switch (this) {
      case Ok<T>(:final value):
        return Result.ok(mapper(value));
      case Error<T>(:final error):
        return Result.error(error);
    }
  }

  Future<Result<R>> flatMap<R>(Future<Result<R>> Function(T value) mapper) async {
    switch (this) {
      case Ok<T>(:final value):
        return await mapper(value);
      case Error<T>(:final error):
        return Result.error(error);
    }
  }
}