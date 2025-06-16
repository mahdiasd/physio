import 'package:dio/dio.dart';
import 'package:network/src/dto/response/network_response.dart';

class ApiWrapper {
  /// GET
  static Future<Response<NetworkResponse<T>>> getRequest<T>(
      Dio dio,
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        required T Function(Object? json) fromJsonT,
      }) async {
    final response = await dio.get<Map<String, dynamic>>(
      path,
      queryParameters: queryParameters,
      options: options,
    );

    return _parseNetworkResponse<T>(response, fromJsonT);
  }

  /// POST
  static Future<Response<NetworkResponse<T>>> postRequest<T>(
      Dio dio,
      String path, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        required T Function(Object? json) fromJsonT,
      }) async {
    final response = await dio.post<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    return _parseNetworkResponse<T>(response, fromJsonT);
  }

  /// PUT
  static Future<Response<NetworkResponse<T>>> putRequest<T>(
      Dio dio,
      String path, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        required T Function(Object? json) fromJsonT,
      }) async {
    final response = await dio.put<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    return _parseNetworkResponse<T>(response, fromJsonT);
  }

  /// DELETE
  static Future<Response<NetworkResponse<T>>> deleteRequest<T>(
      Dio dio,
      String path, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        required T Function(Object? json) fromJsonT,
      }) async {
    final response = await dio.delete<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    return _parseNetworkResponse<T>(response, fromJsonT);
  }

  /// ✅ Private: پارس کردن پاسخ
  static Response<NetworkResponse<T>> _parseNetworkResponse<T>(
      Response<Map<String, dynamic>> response,
      T Function(Object? json) fromJsonT,
      ) {
    final parsed = NetworkResponse<T>.fromJson(response.data!, fromJsonT);

    return Response<NetworkResponse<T>>(
      data: parsed,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
      requestOptions: response.requestOptions,
      isRedirect: response.isRedirect,
      redirects: response.redirects,
      extra: response.extra,
    );
  }
}
