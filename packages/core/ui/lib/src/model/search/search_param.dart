import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_param.g.dart';

@JsonSerializable()
class SearchParam {
  VideoCategory? videoCategory;
  bool? isRecentVideos;
  bool? isMostPopularVideo;
  bool? isShouldersVideo;

  SearchParam({
    this.videoCategory = null,
    this.isRecentVideos = null,
    this.isMostPopularVideo = null,
    this.isShouldersVideo = null,
  });

  factory SearchParam.fromJson(Map<String, dynamic> json) =>
      _$SearchParamFromJson(json);

  Map<String, dynamic> toJson() => _$SearchParamToJson(this);

}