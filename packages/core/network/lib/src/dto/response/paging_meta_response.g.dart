// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_meta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingMetaResponse _$PagingMetaResponseFromJson(Map<String, dynamic> json) =>
    PagingMetaResponse(
      totalPages: (json['totalPages'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      page: (json['page'] as num).toInt(),
    );

Map<String, dynamic> _$PagingMetaResponseToJson(PagingMetaResponse instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'limit': instance.limit,
      'page': instance.page,
    };
