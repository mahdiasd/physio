// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoSummaryResponse _$VideoSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    VideoSummaryResponse(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      coverPhoto: json['coverPhoto'] as String,
      viewCount: (json['viewCount'] as num).toInt(),
      category: json['category'] as String,
      uploader: UploaderUserResponse.fromJson(
          json['uploader'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoSummaryResponseToJson(
        VideoSummaryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coverPhoto': instance.coverPhoto,
      'category': instance.category,
      'viewCount': instance.viewCount,
      'uploader': instance.uploader,
    };
