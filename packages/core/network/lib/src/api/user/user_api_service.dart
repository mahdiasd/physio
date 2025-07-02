import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/response/network_response.dart';

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

  Future<Response<NetworkResponse<String>>> verifyEmail({
    required String code,
    required String email,
  });
}
