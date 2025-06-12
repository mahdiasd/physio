import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

import '../utils/network_log_interceptor.dart'; // Import for kDebugMode

@module
abstract class NetworkModule {
  @LazySingleton()
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://app.dahilive.ir/api',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Only add the logger in debug mode
    if (kDebugMode) {
      // Replace LogInterceptor with your custom one
      dio.interceptors.add(CustomLogInterceptor());
    }
    return dio;
  }
}
