import 'package:ui/ui.dart';

sealed class VideoLibraryEffect {}

class NavigateToSearch extends VideoLibraryEffect {
  final SearchParam searchParams;
  NavigateToSearch(this.searchParams);
}