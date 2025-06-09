import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/src/dto/config/config_response.dart';

import '../../dto/response/network_response.dart';
import 'config_api_service.dart';

@LazySingleton(as: ConfigApiService)
class ConfigApiServiceImpl extends ConfigApiService {
  final Dio dio;

  @override
  ConfigApiServiceImpl(this.dio);

  @override
  Future<Response<NetworkResponse<ConfigResponse>>> getConfig() {
    return dio.get('config');
  }
}
