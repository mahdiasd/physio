import 'package:domain/domain.dart';

class VideoDetailState {
  final bool isLoading;
  final String videoId;
  final Video? video;
  final List<Video> relatedVideos;

  VideoDetailState({
    this.isLoading = false,
    List<Video>? relatedVideos,
    this.video = null,
    this.videoId = "",
  }) : this.relatedVideos = relatedVideos ?? [];

  VideoDetailState copyWith({
    bool? isLoading,
    String? videoId,
    Video? video,
    List<Video>? relatedVideos,
  }) {
    return VideoDetailState(
      video: video ?? this.video,
      relatedVideos: relatedVideos ?? this.relatedVideos,
      isLoading: isLoading ?? this.isLoading,
      videoId: videoId ?? this.videoId,
    );
  }
}
