import 'package:dio/dio.dart';
import 'package:network/src/dto/response/network_response.dart';

import '../../dto/config/config_response.dart';

abstract class ConfigApiService {
  Future<Response<NetworkResponse<ConfigResponse>>> getConfig();
}
