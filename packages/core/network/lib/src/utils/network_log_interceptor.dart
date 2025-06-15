import 'package:dio/dio.dart';
import 'package:utils/utils.dart';

class CustomLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final logMessage = '''
[REQUEST]
- URI: ${options.uri}
- METHOD: ${options.method}
- HEADERS: ${options.headers}
- DATA: ${options.data}''';
    logMessage.dLog(key: 'Dio', plusKey: 'Request');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    final logMessage = '''
[RESPONSE] - ${response.statusCode}
- URI: ${response.requestOptions.uri}
- DATA: ${response.data}''';

    logMessage.dLog(key: 'Dio', plusKey: 'Response');

    // Let the response continue
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final logMessage = '''
[ERROR] - ${err.response?.statusCode ?? 'N/A'}
- URI: ${err.requestOptions.uri}
- TYPE: ${err.type}
- MESSAGE: ${err.message}
- RESPONSE DATA: ${err.response?.data}''';

    logMessage.dLog(key: 'Dio', plusKey: 'Error');

    // Let the error continue
    super.onError(err, handler);
  }
}
