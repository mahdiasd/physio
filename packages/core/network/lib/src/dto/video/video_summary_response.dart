import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/dto/video/uploader_user_response.dart';

import '../../../network.dart';

part 'video_summary_response.g.dart';

@JsonSerializable()
class VideoSummaryResponse {
  VideoSummaryResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.coverPhoto,
    required this.viewCount,
    required this.category,
    required this.uploader,
  });

  factory VideoSummaryResponse.fromJson(Map<String, dynamic> json) => _$VideoSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSummaryResponseToJson(this);

  final String id;
  final String title;
  final String description;
  final String coverPhoto;
  final String category;
  final int viewCount;
  final UploaderUserResponse uploader;
}

