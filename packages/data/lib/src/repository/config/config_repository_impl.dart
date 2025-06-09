import 'package:data/src/mapper/config/config_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class ConfigRepositoryImpl extends ConfigRepository {
  final ConfigApiService _configApiService;

  ConfigRepositoryImpl(this._configApiService);

  @override
  Future<Result<Config>> getConfig() async {
    final result = await ApiCaller.safeApiCall<ConfigResponse>(
          () => _configApiService.getConfig(),
    );

    switch (result) {
      case Ok<ConfigResponse>():
        return Result.ok(result.value.toDomain());
      case Error<ConfigResponse>():
        return Result.error(result.error);
    }
  }
}
