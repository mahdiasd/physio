import 'package:json_annotation/json_annotation.dart';

part 'search_params.g.dart';

@JsonSerializable()
class SearchParams {
  String? videoCategoryId;
  bool? isRecentVideos;
  bool? isMostPopularVideo;
  bool? isShouldersVideo;

  SearchParams({
    this.videoCategoryId = null,
    this.isRecentVideos = null,
    this.isMostPopularVideo = null,
    this.isShouldersVideo = null,
  });

  factory SearchParams.fromJson(Map<String, dynamic> json) =>
      _$SearchParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchParamsToJson(this);

  SearchParams copyWith({
    String? videoCategoryId,
    bool? isRecentVideos,
    bool? isMostPopularVideo,
    bool? isShouldersVideo,
  }) =>
      SearchParams(
          videoCategoryId: videoCategoryId ?? this.videoCategoryId,
          isRecentVideos: isRecentVideos ?? this.isRecentVideos,
          isMostPopularVideo: isMostPopularVideo ?? this.isMostPopularVideo,
          isShouldersVideo: isShouldersVideo ?? this.isShouldersVideo);
}