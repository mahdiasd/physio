import 'package:network/network.dart';
import 'package:domain/domain.dart';

extension VideoCategoryResponseMapper on VideoCategoryResponse {
  VideoCategory toDomain() => VideoCategory(
    id: id,
    name: name,
    description: description,
    colorCode: colorCode,
    isActive: isActive,
  );
}
