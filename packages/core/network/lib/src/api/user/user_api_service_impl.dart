import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/response/network_response.dart';

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
      fromJsonT: (json) =>
          LoginResponse.fromJson(json as Map<String, dynamic>),
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
      fromJsonT: (json) =>
          RegisterResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<Response<NetworkResponse<String>>> validateEmail({
    required String email,
  }) {
    return ApiWrapper.postRequest<String>(
      dio,
      'validate',
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
      fromJsonT: (json) =>
          VerifyEmailResponse.fromJson(json as Map<String, dynamic>),
    );
  }
}
