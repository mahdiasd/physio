import 'package:domain/src/model/config/update/update_state.dart';

class Update {
  const Update({
    required this.forceVersion,
    required this.lastVersion,
    required this.suggestVersion,
    required this.link,
    required this.message,
  });

  final int forceVersion;
  final int lastVersion;
  final int suggestVersion;
  final String link;
  final String message;

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
