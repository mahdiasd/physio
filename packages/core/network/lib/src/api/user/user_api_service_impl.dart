import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/response/network_response.dart';

@LazySingleton(as: UserApiService)
class UserApiServiceImpl extends UserApiService {
  final Dio dio;

  @override
  UserApiServiceImpl(this.dio);

  @override
  Future<Response<NetworkResponse<LoginResponse>>> login(
      {required String email, required String password}) {
    return dio.post('login', data: {'email': email, 'password': password});
  }

  @override
  Future<Response<NetworkResponse<LoginResponse>>> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) {
    return dio.post('login', data: {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password
    });
  }
}
