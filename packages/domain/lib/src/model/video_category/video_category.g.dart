// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCategory _$VideoCategoryFromJson(Map<String, dynamic> json) =>
    VideoCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      colorCode: json['colorCode'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$VideoCategoryToJson(VideoCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'colorCode': instance.colorCode,
      'isActive': instance.isActive,
    };
