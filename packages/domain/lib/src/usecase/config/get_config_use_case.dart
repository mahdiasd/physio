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
          forceVersion: 1,
          lastVersion: 1,
          suggestVersion: 1,
          message: "message",
          googlePlayUrl: "https://play.google.com/store/apps/details?id=com.gameloft.android.ANMP.GloftA9HM&pcampaignid=merch_published_cluster_promotion_battlestar_browse_all_games",
          appStorePlayUrl: "https://www.apple.com/uk/store"),
    )));
  }

}
