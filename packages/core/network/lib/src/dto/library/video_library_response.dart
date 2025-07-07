import 'package:json_annotation/json_annotation.dart';
import 'package:network/network.dart';

part 'video_library_response.g.dart';

@JsonSerializable()
class VideoLibraryResponse {
  VideoLibraryResponse({
    required this.categories,
    required this.mainVideo,
    required this.recentVideos,
    required this.mostVideos,
    required this.blogPosts,
  });

  factory VideoLibraryResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoLibraryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoLibraryResponseToJson(this);

  final VideoCategoryResponse categories;

  final VideoResponse mainVideo;
  final List<VideoResponse> recentVideos;
  final List<VideoResponse> mostVideos;
  final List<BlogPostResponse> blogPosts;
}
