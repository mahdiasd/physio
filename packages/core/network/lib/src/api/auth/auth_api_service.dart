import 'package:dio/dio.dart';

import '../../../network.dart';
import '../../dto/auth/refresh_token_response.dart';

abstract class AuthApiService {
  Future<Response<NetworkResponse<RefreshTokenResponse>>> refreshToken({
    required String refreshToken,
  });
}