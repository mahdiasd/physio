import 'package:domain/src/model/config/update/update_state.dart';

class Update {
  const Update({
    required this.forceVersion,
    required this.lastVersion,
    required this.suggestVersion,
    required this.message,
    required this.googlePlayUrl,
    required this.appStorePlayUrl,
  });

  final int forceVersion;
  final int lastVersion;
  final int suggestVersion;
  final String message;
  final String googlePlayUrl;
  final String appStorePlayUrl;

  UpdateState getState(int currentAppVersionCode) {
    if (forceVersion > currentAppVersionCode) {
      return UpdateState.updateRequired;
    }
    if (suggestVersion > currentAppVersionCode) {
      return UpdateState.updateRecommended;
    }
    return UpdateState.upToDate;
  }
}
