sealed class VideoDetailEffect {}

class NavigateBack extends VideoDetailEffect {}

class NavigateToVideoDetail extends VideoDetailEffect {
  final String videoId;

  NavigateToVideoDetail(this.videoId);
}
