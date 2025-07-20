import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:storage/storage.dart';

import '../api/auth/auth_api_service_impl.dart';
import '../utils/network_log_interceptor.dart';
import '../utils/token_interceptor.dart';

@module
abstract class NetworkModule {
  @Named('baseUrl')
  @LazySingleton()
  String get baseUrl => 'https://api.rosephysiohub.com/';

  @Named('dioWithoutInterceptors')
  @LazySingleton()
  Dio dioWithoutInterceptors(@Named('baseUrl') String baseUrl) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  @LazySingleton()
  Dio dio(
      @Named('baseUrl') String baseUrl,
      @Named('dioWithoutInterceptors') Dio dioWithoutInterceptors,
      StorageService storageService,
      ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    final authApiService = AuthApiServiceImpl(dioWithoutInterceptors);

    dio.interceptors.add(
      TokenInterceptor(
        storageService,
        dioWithoutInterceptors,
        authApiService,
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(CustomLogInterceptor());
    }

    return dio;
  }
}
