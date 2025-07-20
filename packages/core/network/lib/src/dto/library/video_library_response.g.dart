// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_library_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoLibraryResponse _$VideoLibraryResponseFromJson(
        Map<String, dynamic> json) =>
    VideoLibraryResponse(
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          null,
      mainVideo: json['mainVideo'] == null
          ? null
          : VideoSummaryResponse.fromJson(
              json['mainVideo'] as Map<String, dynamic>),
      recentVideos: (json['recentVideos'] as List<dynamic>?)
              ?.map((e) =>
                  VideoSummaryResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      mostVideos: (json['mostVideos'] as List<dynamic>?)
              ?.map((e) =>
                  VideoSummaryResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      shouldersVideos: (json['shouldersVideos'] as List<dynamic>?)
              ?.map((e) =>
                  VideoSummaryResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      blogPosts: (json['blogPosts'] as List<dynamic>?)
              ?.map((e) => BlogPostResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );

Map<String, dynamic> _$VideoLibraryResponseToJson(
        VideoLibraryResponse instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'mainVideo': instance.mainVideo,
      'recentVideos': instance.recentVideos,
      'mostVideos': instance.mostVideos,
      'shouldersVideos': instance.shouldersVideos,
      'blogPosts': instance.blogPosts,
    };
