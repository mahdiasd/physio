import 'package:data/src/mapper/blog_post/blog_post_mapper.dart';
import 'package:data/src/mapper/video_category/video_category_mapper.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';

import '../video/video_mapper.dart';

extension VideoLibraryResponseMapper on VideoLibraryResponse {
  VideoLibrary toDomain() => VideoLibrary(
        categories: categories?.toDomain(),
        mainVideo: mainVideo?.toDomain(),
        recentVideos: recentVideos?.map((e) => e.toDomain()).toList(),
        mostVideos: mostVideos?.map((e) => e.toDomain()).toList(),
    shouldersVideos: shouldersVideos?.map((e) => e.toDomain()).toList(),
        blogPosts: blogPosts?.map((e) => e.toDomain()).toList(),
      );
}
