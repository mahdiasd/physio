import 'package:dio/dio.dart';
import 'package:network/network.dart';

abstract class UserApiService {
  Future<Response<NetworkResponse<LoginResponse>>> login({
    required String email,
    required String password,
  });

  Future<Response<NetworkResponse<RegisterResponse>>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<Response<NetworkResponse<String>>> validateEmail({
    required String email,
  });

  Future<Response<NetworkResponse<VerifyEmailResponse>>> verifyEmail({
    required String code,
    required String email,
  });

  Future<Response<NetworkResponse<EmptyResponse>>> resendOTP({
    required String email,
    required String type,
  });

  Future<Response<NetworkResponse<ResetPasswordResponse>>> resetPassword({
    required String email,
    required String code,
    required String password,
    required String confirmPassword,
  });

}
