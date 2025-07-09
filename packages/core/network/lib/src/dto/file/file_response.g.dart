// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileResponse _$FileResponseFromJson(Map<String, dynamic> json) => FileResponse(
      id: json['id'] as String,
      originalFilename: json['originalFilename'] as String,
      storedFilename: json['storedFilename'] as String,
      storagePath: json['storagePath'] as String,
      contentType: json['contentType'] as String,
      fileCategory: json['fileCategory'] as String,
      status: json['status'] as String,
      isPublic: json['isPublic'] as bool,
    );

Map<String, dynamic> _$FileResponseToJson(FileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalFilename': instance.originalFilename,
      'storedFilename': instance.storedFilename,
      'storagePath': instance.storagePath,
      'contentType': instance.contentType,
      'fileCategory': instance.fileCategory,
      'status': instance.status,
      'isPublic': instance.isPublic,
    };
