import 'package:domain/domain.dart';

class SearchState {
  final bool isRefreshing;
  final bool isLoadMore;
  final bool showCategoryDialog;
  final String searchText;
  final Paging<Video> paging;
  final List<VideoCategory> categories;

  const SearchState({
    this.isRefreshing = false,
    this.isLoadMore = false,
    this.showCategoryDialog = false,
    this.searchText = "",
    this.categories = const [],
    this.paging = const Paging(content: []),
  });

  SearchState copyWith({
    bool? isRefreshing,
    bool? isLoadMore,
    String? searchText,
    bool? showCategoryDialog,
    Paging<Video>? paging,
    List<VideoCategory>? categories,
  }) {
    return SearchState(
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      searchText: searchText ?? this.searchText,
      showCategoryDialog: showCategoryDialog ?? this.showCategoryDialog,
      paging: paging ?? this.paging,
      categories: categories ?? this.categories,
    );
  }
}
