import 'package:json_annotation/json_annotation.dart';

import '../../../network.dart';

part 'video_response.g.dart';

@JsonSerializable()
class VideoResponse {
  VideoResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.thumbnail,
    required this.durationSeconds,
    required this.category,
    required this.visibility,
    required this.status,
    required this.viewCount,
    required this.createdAt,
  });

  factory VideoResponse.fromJson(Map<String, dynamic> json) => _$VideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResponseToJson(this);

  final String id;
  final String title;
  final String description;
  final String url;
  final String thumbnail;
  final int durationSeconds;
  final VideoCategoryResponse category;
  final String visibility;
  final String status;
  final int viewCount;
  final DateTime createdAt;
}
