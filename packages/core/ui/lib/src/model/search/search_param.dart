import 'package:domain/domain.dart';

class SearchParams {
  VideoCategory? videoCategory;
  bool? isRecentVideos;
  bool? isMostPopularVideo;
  bool? isShouldersVideo;

  SearchParams({
    this.videoCategory = null,
    this.isRecentVideos = null,
    this.isMostPopularVideo = null,
    this.isShouldersVideo = null,
  });
}