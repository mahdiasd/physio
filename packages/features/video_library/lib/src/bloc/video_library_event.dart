import 'package:domain/domain.dart';

sealed class VideoLibraryEvent {}

class OnRefresh extends VideoLibraryEvent {}
class OnSearchClick extends VideoLibraryEvent {}
class OnMoreRecentVideosClick extends VideoLibraryEvent {}
class OnMoreMostViewedVideosClick extends VideoLibraryEvent {}
class OnMoreShouldersVideosClick extends VideoLibraryEvent {}
class OnMoreBlogPostClick extends VideoLibraryEvent {}
class OnMoreCategoriesClick extends VideoLibraryEvent {}

class OnSelectCategory extends VideoLibraryEvent {
  final VideoCategory category;
  OnSelectCategory(this.category);
}

class OnVideoClick extends VideoLibraryEvent {
  final Video video;
  OnVideoClick(this.video);
}

class OnBlogPostClick extends VideoLibraryEvent {
  final BlogPost post;
  OnBlogPostClick(this.post);
}
