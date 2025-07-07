import 'package:data/src/mapper/file/file_mapper.dart';
import 'package:data/src/mapper/video_category/video_category_mapper.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';

extension VideoResponseMapper on VideoResponse {
  Video toDomain() => Video(
    id: id,
    title: title,
    description: description,
    file: file.toDomain(),
    thumbnailFile: thumbnailFile.toDomain(),
    durationSeconds: durationSeconds,
    category: category.toDomain(),
    visibility: visibility.toVideoVisibility(),
    status: status.toVideoStatus(),
    viewCount: viewCount,
    createdAt: createdAt,
  );
}

extension VideoVisibilityX on String {
  VideoVisibility toVideoVisibility() {
    switch (this) {
      case 'private':
        return VideoVisibility.private;
      case 'public':
        return VideoVisibility.public;
      default:
        throw Exception('Unknown VideoVisibility: $this');
    }
  }
}

extension VideoVisibilityToString on VideoVisibility {
  String toJson() => toString().split('.').last;
}

extension VideoStatusX on String {
  VideoStatus toVideoStatus() {
    switch (this) {
      case 'processing':
        return VideoStatus.processing;
      case 'ready':
        return VideoStatus.ready;
      case 'failed':
        return VideoStatus.failed;
      default:
        throw Exception('Unknown VideoStatus: $this');
    }
  }
}

extension VideoStatusToString on VideoStatus {
  String toJson() => toString().split('.').last;
}