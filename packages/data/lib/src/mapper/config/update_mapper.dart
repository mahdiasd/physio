import 'package:domain/domain.dart';
import 'package:network/network.dart';

/// Extension on UpdateResponse to map it to domain Update model
extension UpdateResponseMapper on UpdateResponse {
  /// Converts a UpdateResponse to a Update domain model
  Update toDomain() => Update(
      forceVersion : forceVersion,
      lastVersion : lastVersion,
      suggestVersion : suggestVersion,
      link : link,
      message : message,
  );
}
