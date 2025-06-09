// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResponse _$UpdateResponseFromJson(Map<String, dynamic> json) =>
    UpdateResponse(
      forceVersion: (json['force_version'] as num?)?.toInt() ?? 0,
      lastVersion: (json['last_version'] as num?)?.toInt() ?? 0,
      suggestVersion: (json['suggest_version'] as num?)?.toInt() ?? 0,
      link: json['link'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$UpdateResponseToJson(UpdateResponse instance) =>
    <String, dynamic>{
      'force_version': instance.forceVersion,
      'last_version': instance.lastVersion,
      'suggest_version': instance.suggestVersion,
      'link': instance.link,
      'message': instance.message,
    };
