import 'dart:async';

import 'package:dio/dio.dart';
import 'package:network/src/dto/response/network_response.dart';
import 'package:utils/utils.dart';

// error_response.dart
import 'package:json_annotation/json_annotation.dart';

import '../dto/response/error_response.dart';


// api_caller.dart
abstract class ApiCaller {
  static Future<Result<T>> safeApiCall<T>(
      Future<Response<NetworkResponse<T>>> Function() apiCall,
      ) async {
    try {
      final response = await apiCall();

      if (response.statusCode == null ||
          response.statusCode! < 200 ||
          response.statusCode! >= 300) {
        _printError(
          'HTTP Error (${response.statusCode}): ${response.statusMessage ?? "No message"}',
          'safeApiCall - status check',
        );

        // Try to parse error response from server
        final errorResponse = _parseErrorResponse(response);
        if (errorResponse != null) {
          return Result.error(HttpException(
            code: errorResponse.statusCode,
            message: errorResponse.message,
          ));
        }

        return Result.error(HttpException(
          code: response.statusCode,
          message: response.statusMessage ?? 'HTTP Error',
        ));
      }

      final networkResponse = response.data;
      if (networkResponse == null || networkResponse.data == null) {
        _printError(
          'Response format malformed! Status: ${response.statusCode}',
          'safeApiCall - null response check',
        );
        return Result.error(
          const HttpException(code: 400, message: 'Response format malformed!'),
        );
      }

      if (networkResponse.status != 'success') {
        _printError(
          'Server Error: ${networkResponse.message ?? "No message"} | Status: ${response.statusCode}',
          'safeApiCall - status != success',
        );
        return Result.error(
          HttpException(
            message: networkResponse.message ?? 'Server Error',
            code: response.statusCode,
          ),
        );
      }

      return Result.ok(networkResponse.data as T);
    } on DioException catch (e) {
      _printError(
        'DioException: ${e.message} | Type: ${e.type} | Exception: $e',
        'safeApiCall - DioException',
      );
      return Result.error(_handleDioError(e));
    } catch (e) {
      _printError(
        'Unexpected error: $e',
        'safeApiCall - unknown error',
      );
      return Result.error(
        const UnknownException(message: 'Unexpected error occurred'),
      );
    }
  }

  static AppException _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(message: e.message ?? 'Request timed out');
      case DioExceptionType.badResponse:
        return _parseHttpError(e.response!);
      case DioExceptionType.connectionError:
        return NetworkException(
          message: e.message ?? 'Connection error',
          code: e.response?.statusCode,
        );
      case DioExceptionType.badCertificate:
        return NetworkException(
          message: e.message ?? 'Certificate error',
          code: e.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return NetworkException(
          message: e.message ?? 'Request cancelled',
          code: e.response?.statusCode,
        );
      default:
        return NetworkException(
          message: e.message ?? 'Network error',
          code: e.response?.statusCode,
        );
    }
  }

  static AppException _parseHttpError(Response<dynamic> response) {
    _printError(
      'HTTP Parsing Error: ${response.statusCode} - ${response.statusMessage}',
      '_parseHttpError',
    );

    // Try to parse error response from server
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

  static ErrorResponse? _parseErrorResponse(Response<dynamic> response) {
    try {
      if (response.data != null && response.data is Map<String, dynamic>) {
        final Map<String, dynamic> errorData = response.data as Map<String, dynamic>;

        // Check if the response has the expected error structure
        if (errorData.containsKey('message') &&
            errorData.containsKey('error') &&
            errorData.containsKey('statusCode')) {
          return ErrorResponse.fromJson(errorData);
        }
      }
    } catch (e) {
      _printError(
        'Failed to parse error response: $e',
        '_parseErrorResponse',
      );
    }
    return null;
  }

  // Helper function for colored error printing
  static void _printError(String message, String location) {
    final errorHeader = '\x1B[31m══╣ ERROR [$location] ╠══';
    final errorBody = '\x1B[91m$message\x1B[0m';
    final separator = '\x1B[31m' + ('═' * 80) + '\x1B[0m';

    print(separator);
    print(errorHeader);
    print(errorBody);
    print(separator);
  }
}