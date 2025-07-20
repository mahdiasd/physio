import 'package:json_annotation/json_annotation.dart';
import 'package:network/network.dart';

part 'video_library_response.g.dart';

@JsonSerializable()
class VideoLibraryResponse {
  VideoLibraryResponse({
    this.categories = null,
    this.mainVideo = null,
    this.recentVideos = null,
    this.mostVideos = null,
    this.shouldersVideos = null,
    this.blogPosts = null,
  });

  factory VideoLibraryResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoLibraryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoLibraryResponseToJson(this);

  final List<String>? categories;
  final VideoSummaryResponse? mainVideo;
  final List<VideoSummaryResponse>? recentVideos;
  final List<VideoSummaryResponse>? mostVideos;
  final List<VideoSummaryResponse>? shouldersVideos;
  final List<BlogPostResponse>? blogPosts;
}
