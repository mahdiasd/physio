import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/src/dto/auth/refresh_token_response.dart';

import '../../../network.dart';
import 'auth_api_service.dart';

@LazySingleton(as: AuthApiService)
class AuthApiServiceImpl implements AuthApiService {
  final Dio dio;

  AuthApiServiceImpl(this.dio);

  @override
  Future<Response<NetworkResponse<RefreshTokenResponse>>> refreshToken({
    required String refreshToken,
  }) async {
    return ApiWrapper.postRequest<RefreshTokenResponse>(
      dio,
      'v1/auth/refresh-token',
      data: {
        'refreshToken': refreshToken,
      },
      fromJsonT: (json) => RefreshTokenResponse.fromJson(json as Map<String, dynamic>),
    );
  }
}
