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

  final List<String>? categories;
  final VideoSummary? mainVideo;
  final List<VideoSummary>? recentVideos;
  final List<VideoSummary>? mostVideos;
  final List<VideoSummary>? shouldersVideos;
  final List<BlogPost>? blogPosts;
}
