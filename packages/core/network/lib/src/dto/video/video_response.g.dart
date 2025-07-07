// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) =>
    VideoResponse(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      file: FileResponse.fromJson(json['file'] as Map<String, dynamic>),
      thumbnailFile:
          FileResponse.fromJson(json['thumbnailFile'] as Map<String, dynamic>),
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      category: VideoCategoryResponse.fromJson(
          json['category'] as Map<String, dynamic>),
      visibility: json['visibility'] as String,
      status: json['status'] as String,
      viewCount: (json['viewCount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$VideoResponseToJson(VideoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'file': instance.file,
      'thumbnailFile': instance.thumbnailFile,
      'durationSeconds': instance.durationSeconds,
      'category': instance.category,
      'visibility': instance.visibility,
      'status': instance.status,
      'viewCount': instance.viewCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
