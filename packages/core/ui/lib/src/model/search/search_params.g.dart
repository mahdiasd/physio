// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchParams _$SearchParamsFromJson(Map<String, dynamic> json) => SearchParams(
      videoCategoryId: json['videoCategoryId'] as String? ?? null,
      isRecentVideos: json['isRecentVideos'] as bool? ?? null,
      isMostPopularVideo: json['isMostPopularVideo'] as bool? ?? null,
      isShouldersVideo: json['isShouldersVideo'] as bool? ?? null,
    );

Map<String, dynamic> _$SearchParamsToJson(SearchParams instance) =>
    <String, dynamic>{
      'videoCategoryId': instance.videoCategoryId,
      'isRecentVideos': instance.isRecentVideos,
      'isMostPopularVideo': instance.isMostPopularVideo,
      'isShouldersVideo': instance.isShouldersVideo,
    };
