import 'package:domain/domain.dart';

class VideoDetailState {
  final bool isLoading;
  final String videoId;
  final Video? video;

  VideoDetailState({
    this.isLoading = false,
    this.video = null,
    this.videoId = "",
  });

  VideoDetailState copyWith({
    bool? isLoading,
    String? videoId,
    Video? video,
  }) {
    return VideoDetailState(
      video: video ?? this.video,
      isLoading: isLoading ?? this.isLoading,
      videoId: videoId ?? this.videoId,
    );
  }
}
