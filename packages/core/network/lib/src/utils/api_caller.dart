import 'dart:async';

import 'package:dio/dio.dart';
import 'package:network/src/dto/response/network_response.dart';
import 'package:utils/utils.dart';

abstract class ApiCaller {
  static Future<Result<T>> safeApiCall<T>(
    Future<Response<NetworkResponse<T>>> Function() apiCall,
  ) async {
    try {
      final response = await apiCall();

      if (response.statusCode == null ||
          response.statusCode! < 200 ||
          response.statusCode! >= 300) {
        return Result.error(HttpException(
          code: response.statusCode,
          message: response.statusMessage ?? 'HTTP Error',
        ));
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
            message: networkResponse.message ?? 'Server Error',
            code: response.statusCode,
          ),
        );
      }

      return Result.ok(networkResponse.data as T);
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } catch (e) {
      return Result.error(
        const UnknownException(message: 'Unexpected error occurred'),
      );
    }
  }

  static Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(message: e.message ?? 'Request timed out');
      case DioExceptionType.badResponse:
        return _parseHttpError(e.response!);
      default:
        return NetworkException(message: e.message ?? 'Network error');
    }
  }

  static Exception _parseHttpError(Response<dynamic> response) {
    return HttpException(
      code: response.statusCode,
      message: response.statusMessage ?? 'HTTP Error',
    );
  }
}
