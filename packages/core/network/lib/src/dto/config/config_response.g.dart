// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigResponse _$ConfigResponseFromJson(Map<String, dynamic> json) =>
    ConfigResponse(
      UpdateResponse.fromJson(json['update'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigResponseToJson(ConfigResponse instance) =>
    <String, dynamic>{
      'update': instance.update,
    };
