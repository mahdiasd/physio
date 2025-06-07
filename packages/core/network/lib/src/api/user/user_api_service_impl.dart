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
    String username,
    String password,
  ) {
    return dio
        .post('login', data: {'username': username, 'password': password});
  }
}
