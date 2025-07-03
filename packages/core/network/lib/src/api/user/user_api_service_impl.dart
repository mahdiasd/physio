import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

@LazySingleton(as: UserApiService)
class UserApiServiceImpl extends UserApiService {
  final Dio dio;

  UserApiServiceImpl(this.dio);

  @override
  Future<Response<NetworkResponse<LoginResponse>>> login({
    required String email,
    required String password,
  }) {
    return ApiWrapper.postRequest<LoginResponse>(
      dio,
      'v1/auth/login',
      data: {
        'email': email,
        'password': password,
      },
      fromJsonT: (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<Response<NetworkResponse<RegisterResponse>>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    return ApiWrapper.postRequest<RegisterResponse>(
      dio,
      'v1/auth/register',
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'role': "CLIENT",
      },
      fromJsonT: (json) => RegisterResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<Response<NetworkResponse<String>>> validateEmail({
    required String email,
  }) {
    return ApiWrapper.postRequest<String>(
      dio,
      'v1/auth/forgot',
      data: {
        'email': email,
      },
      fromJsonT: (json) => json.toString(),
    );
  }

  @override
  Future<Response<NetworkResponse<VerifyEmailResponse>>> verifyEmail({
    required String code,
    required String email,
  }) {
    return ApiWrapper.postRequest<VerifyEmailResponse>(
      dio,
      'v1/auth/verify/email',
      data: {
        'code': code,
        'email': email,
      },
      fromJsonT: (json) => VerifyEmailResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<Response<NetworkResponse<EmptyResponse>>> resendOTP({
    required String email,
    required String type,
  }) {
    return ApiWrapper.postRequest<EmptyResponse>(
      dio,
      'v1/auth/resend',
      data: {
        'email': email,
        'type': type,
      },
      fromJsonT: (json) => EmptyResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<Response<NetworkResponse<ResetPasswordResponse>>> resetPassword({required String email, required String code, required String password, required String confirmPassword}) {
    return ApiWrapper.postRequest<ResetPasswordResponse>(
      dio,
      'v1/auth/reset',
      data: {
        'email': email,
        'code': code,
        'password': password,
        'confirmPassword': confirmPassword,
      },
      fromJsonT: (json) => ResetPasswordResponse.fromJson(json as Map<String, dynamic>),
    );
  }
}
