import 'package:domain/domain.dart';

sealed class VideoLibraryEffect {}

class NavigateToSearch extends VideoLibraryEffect {
  final VideoCategory? category;
  NavigateToSearch(this.category);
}