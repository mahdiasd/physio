import 'package:domain/domain.dart';

class VideoDetailState {
  final bool isLoading;
  final String videoId;
  final VideoSummary? video;
  final List<VideoSummary> relatedVideos;

  VideoDetailState({
    this.isLoading = false,
    List<VideoSummary>? relatedVideos,
    this.video = null,
    this.videoId = "",
  }) : this.relatedVideos = relatedVideos ?? [];

  VideoDetailState copyWith({
    bool? isLoading,
    String? videoId,
    VideoSummary? video,
    List<VideoSummary>? relatedVideos,
  }) {
    return VideoDetailState(
      video: video ?? this.video,
      relatedVideos: relatedVideos ?? this.relatedVideos,
      isLoading: isLoading ?? this.isLoading,
      videoId: videoId ?? this.videoId,
    );
  }
}
