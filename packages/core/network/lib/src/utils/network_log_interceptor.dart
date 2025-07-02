import 'package:dio/dio.dart';
import 'package:utils/utils.dart';

import 'dart:convert';

class CustomLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final buffer = StringBuffer()
      ..writeln('METHOD: ${options.method}')
      ..writeln('URL: ${options.uri}')
      ..writeln('HEADERS: ${prettyJson(options.headers)}')
      ..writeln('QUERY PARAMETERS: ${prettyJson(options.queryParameters)}')
      ..writeln('BODY: ${prettyJson(options.data)}');

    PrintHelper.info(buffer.toString(), location: 'Dio → Request');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    final buffer = StringBuffer()
      ..writeln('STATUS: ${response.statusCode}')
      ..writeln('URL: ${response.requestOptions.uri}')
      ..writeln('RESPONSE BODY: ${prettyJson(response.data)}');

    PrintHelper.success(buffer.toString(), location: 'Dio → Response');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final buffer = StringBuffer()
      ..writeln('TYPE: ${err.type}')
      ..writeln('MESSAGE: ${err.message}')
      ..writeln('URL: ${err.requestOptions.uri}')
      ..writeln('STATUS: ${err.response?.statusCode ?? 'N/A'}')
      ..writeln('RESPONSE DATA: ${prettyJson(err.response?.data)}');

    PrintHelper.error(buffer.toString(), location: 'Dio → Error');
    super.onError(err, handler);
  }

  String prettyJson(dynamic jsonObject) {
    const encoder = JsonEncoder.withIndent('  ');
    try {
      if (jsonObject is String) {
        return jsonObject;
      }
      return encoder.convert(jsonObject);
    } catch (e) {
      return jsonObject.toString();
    }
  }
}

