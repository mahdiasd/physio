// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) =>
    VideoResponse(
      category: json['category'] as String,
      coverPhoto: json['coverPhoto'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String,
      id: json['id'] as String,
      isPublic: json['isPublic'] as bool,
      relatedVideos: (json['relatedVideos'] as List<dynamic>)
          .map((e) => VideoSummaryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      uploader: UploaderUserResponse.fromJson(
          json['uploader'] as Map<String, dynamic>),
      videoFile:
          FileResponse.fromJson(json['videoFile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoResponseToJson(VideoResponse instance) =>
    <String, dynamic>{
      'category': instance.category,
      'coverPhoto': instance.coverPhoto,
      'createdAt': instance.createdAt.toIso8601String(),
      'description': instance.description,
      'id': instance.id,
      'isPublic': instance.isPublic,
      'relatedVideos': instance.relatedVideos,
      'status': instance.status,
      'tags': instance.tags,
      'title': instance.title,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'uploader': instance.uploader,
      'videoFile': instance.videoFile,
    };
