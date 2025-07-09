// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCategoryResponse _$VideoCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    VideoCategoryResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      colorCode: json['colorCode'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$VideoCategoryResponseToJson(
        VideoCategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'colorCode': instance.colorCode,
      'isActive': instance.isActive,
    };
