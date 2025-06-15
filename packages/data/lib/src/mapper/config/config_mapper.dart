import 'package:data/src/mapper/config/update_mapper.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';

/// Extension on ConfigResponse to map it to domain Config model
extension ConfigResponseMapper on ConfigResponse {
  /// Converts a ConfigResponse to a Config domain model
  Config toDomain() => Config(
    update: update.toDomain(),
  );
}
