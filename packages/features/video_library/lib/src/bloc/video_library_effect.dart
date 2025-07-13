import 'package:ui/ui.dart';

sealed class VideoLibraryEffect {}

class NavigateToSearch extends VideoLibraryEffect {
  final SearchParams searchParams;
  NavigateToSearch(this.searchParams);
}
class NavigateToVideoDetail extends VideoLibraryEffect {
  final String videoId;
  NavigateToVideoDetail(this.videoId);
}