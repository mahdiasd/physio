import '../../../domain.dart';

class VideoLibrary {
  VideoLibrary({
    this.categories = null,
    this.mainVideo = null,
    this.recentVideos = null,
    this.mostVideos = null,
    this.shouldersVideos = null,
    this.blogPosts = null,
  });

  final List<VideoCategory>? categories;
  final Video? mainVideo;
  final List<Video>? recentVideos;
  final List<Video>? mostVideos;
  final List<Video>? shouldersVideos;
  final List<BlogPost>? blogPosts;
}
