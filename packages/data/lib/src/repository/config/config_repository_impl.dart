import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:utils/utils.dart';

import '../../mapper/mapper.dart';

@LazySingleton(as: ConfigRepository)
class ConfigRepositoryImpl extends ConfigRepository {
  final ConfigApiService _configApiService;
  final Mappr _mappr;

  ConfigRepositoryImpl(this._configApiService, this._mappr);

  @override
  Future<Result<Config>> getConfig() async {
    final result = await ApiCaller.safeApiCall<ConfigResponse>(
      () => _configApiService.getConfig(),
    );

    switch (result) {
      case Ok<ConfigResponse>():
        return Result.ok(_mappr.convert<ConfigResponse, Config>(result.value));
      case Error<ConfigResponse>():
        return Result.error(result.error);
    }
  }
}
