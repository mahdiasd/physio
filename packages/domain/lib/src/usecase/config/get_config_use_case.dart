import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@injectable
class GetConfigUseCase {
  final ConfigRepository _configRepository;

  GetConfigUseCase(this._configRepository);

  Future<Result<Config>> getConfig() {
    // TODO: remove this fake data
    return Future.value(Result.ok(Config(
      update: Update(
          forceVersion: 2,
          lastVersion: 2,
          suggestVersion: 2,
          message: "message",
          googlePlayUrl: "googlePlayUrl",
          appStorePlayUrl: "appStorePlayUrl"),
    )));
  }

}
