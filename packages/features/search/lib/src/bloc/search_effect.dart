sealed class SearchEffect {}

class NavigateBack extends SearchEffect {}

class NavigateToVideoDetail extends SearchEffect {
  final String videoId;

  NavigateToVideoDetail(this.videoId);
}
