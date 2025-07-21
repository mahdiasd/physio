// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileResponse _$FileResponseFromJson(Map<String, dynamic> json) => FileResponse(
      contentType: json['contentType'] as String,
      fileCategory: json['fileCategory'] as String,
      fileSize: json['fileSize'] as String,
      id: json['id'] as String,
      originalFilename: json['originalFilename'] as String,
      s3Url: json['s3Url'] as String,
      storagePath: json['storagePath'] as String,
      storageType: json['storageType'] as String,
      storedFilename: json['storedFilename'] as String,
      uploadedBy: json['uploadedBy'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$FileResponseToJson(FileResponse instance) =>
    <String, dynamic>{
      'contentType': instance.contentType,
      'fileCategory': instance.fileCategory,
      'fileSize': instance.fileSize,
      'id': instance.id,
      'originalFilename': instance.originalFilename,
      's3Url': instance.s3Url,
      'storagePath': instance.storagePath,
      'storageType': instance.storageType,
      'storedFilename': instance.storedFilename,
      'uploadedBy': instance.uploadedBy,
      'url': instance.url,
    };
