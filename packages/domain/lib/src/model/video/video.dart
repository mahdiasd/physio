import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain.dart';

part 'video.freezed.dart';

@freezed
abstract class Video with _$Video {
  const factory Video({
    required String category,
    required String coverPhoto,
    required DateTime createdAt,
    required String description,
    required String id,
    required bool isPublic,
    required List<VideoSummary> relatedVideos,
    required String status,
    required List<String> tags,
    required String title,
    required DateTime updatedAt,
    required UploaderUser uploader,
    required PhysioFile videoFile,
    required bool isFlagged,
  }) = _Video;
}
