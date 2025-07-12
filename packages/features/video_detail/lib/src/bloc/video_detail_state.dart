import 'package:domain/domain.dart';

class VideoDetailState {
  final bool isLoading;
  final String videoId;
  final Video? video;
  final List<Video>? relatedVideos;

  VideoDetailState({
    this.isLoading = false,
    this.relatedVideos = null,
    this.video = null,
    this.videoId = "",
  });

  VideoDetailState copyWith({
    bool? isLoading,
    String? videoId,
  }) {
    return VideoDetailState(
      isLoading: isLoading ?? this.isLoading,
      videoId: videoId ?? this.videoId,
    );
  }
}
