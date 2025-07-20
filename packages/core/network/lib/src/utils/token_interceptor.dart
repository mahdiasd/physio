import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:network/src/dto/auth/refresh_token_response.dart';
import 'package:storage/storage.dart';
import 'package:utils/utils.dart';

import '../../network.dart';
import '../api/auth/auth_api_service.dart';

@LazySingleton()
class TokenInterceptor extends QueuedInterceptor {
  final StorageService _storageService;
  final Dio _dio;
  final AuthApiService _authApiService;

  TokenInterceptor(
      this._storageService,
      this._dio,
      this._authApiService,
      );

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    // Routes that do not require a token
    final noAuthEndpoints = [
      '/v1/auth/login',
      '/v1/auth/register',
      '/v1/auth/refresh',
      '/v1/auth/forgot-password',
      '/v1/auth/verify/email',
      '/v1/auth/resend',
    ];

    final isNoAuthEndpoint = noAuthEndpoints.any(
          (endpoint) => options.path.contains(endpoint),
    );

    if (!isNoAuthEndpoint) {
      final accessToken = await _storageService.read(key: StorageKeys.accessToken);
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode == 401) {
      try {
        // Get a new token
        final newAccessToken = await _refreshToken();

        if (newAccessToken != null) {
          // Resend the original request with the new token
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';

          final response = await _dio.fetch(options);
          handler.resolve(response);
          return;
        } // If the refresh token has also expired, log out the user
      } catch (e) { // If the refresh token has also expired, log out the user
        await _logout();
        handler.reject(err);
        return;
      }
    }

    handler.next(err);
  }

  Future<String?> _refreshToken() async {
    final refreshToken = await _storageService.read(key: StorageKeys.refreshToken);
    if (refreshToken == null) return null;

    try {
      final result = await ApiCaller.safeApiCall<RefreshTokenResponse>(() => _authApiService.refreshToken(refreshToken: refreshToken));

      switch (result) {
        case Ok<RefreshTokenResponse>():
          await _storageService.write(key: StorageKeys.accessToken, value: result.value.accessToken);
          await _storageService.write(key: StorageKeys.refreshToken, value: result.value.refreshToken);
          break;
        case Error<RefreshTokenResponse>():
          await _logout();
          break;
      }
    } catch (e) {
      debugPrint('Error refreshing token: $e');
    }

    return null;
  }

  Future<void> _logout() async {
    await _storageService.delete(key: StorageKeys.accessToken);
    await _storageService.delete(key: StorageKeys.refreshToken);
    // You can redirect the user to the login page here
    // Or send an event for logout
  }
}