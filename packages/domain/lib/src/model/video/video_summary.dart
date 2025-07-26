import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain.dart';

part 'video_summary.freezed.dart';

@freezed
abstract class VideoSummary with _$VideoSummary {
  const factory VideoSummary({
    required String id,
    required String title,
    required String description,
    required String coverPhoto,
    required String category,
    required int viewCount,
    required UploaderUser uploader,
  }) = _VideoSummary;
}

