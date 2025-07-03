import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

import '../utils/network_log_interceptor.dart';

@module
abstract class NetworkModule {
  @LazySingleton()
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.rosephysiohub.com/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(CustomLogInterceptor());
    }

    return dio;
  }
}
