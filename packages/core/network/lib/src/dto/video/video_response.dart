import 'package:json_annotation/json_annotation.dart';

import '../../../network.dart';

part 'video_response.g.dart';

@JsonSerializable()
class VideoResponse {
  String category;
  String coverPhoto;
  DateTime createdAt;
  String description;
  String id;
  bool isPublic;
  List<VideoSummaryResponse> relatedVideos;
  String status;
  List<String> tags;
  String title;
  DateTime updatedAt;
  UploaderUserResponse uploader;
  FileResponse videoFile;
  int flags;

  VideoResponse({
    required this.category,
    required this.coverPhoto,
    required this.createdAt,
    required this.description,
    required this.id,
    required this.isPublic,
    required this.relatedVideos,
    required this.status,
    required this.tags,
    required this.title,
    required this.updatedAt,
    required this.flags,
    required this.uploader,
    required this.videoFile,
  });

  factory VideoResponse.fromJson(Map<String, dynamic> json) => _$VideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResponseToJson(this);

}

