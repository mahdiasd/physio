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
      url: json['url'] as String,
      thumbnail: json['thumbnail'] as String,
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
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'durationSeconds': instance.durationSeconds,
      'category': instance.category,
      'visibility': instance.visibility,
      'status': instance.status,
      'viewCount': instance.viewCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
