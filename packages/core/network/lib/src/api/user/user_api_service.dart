import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/response/network_response.dart';

abstract class UserApiService {
  Future<Response<NetworkResponse<LoginResponse>>> login(
      String username, String password);
}
