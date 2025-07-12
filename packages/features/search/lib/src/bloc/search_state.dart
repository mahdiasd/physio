import 'package:domain/domain.dart';
import 'package:ui/ui.dart';

class SearchState {
  final bool isRefreshing;
  final bool isLoadMore;
  final bool showCategoryDialog;
  final SearchParams? searchParam;
  final String searchText;
  final Paging<Video> paging;
  final List<VideoCategory> categories;

  const SearchState({
    this.isRefreshing = false,
    this.isLoadMore = false,
    this.searchParam = null,
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
    SearchParams? searchParams,
    Paging<Video>? paging,
    List<VideoCategory>? categories,
  }) {
    return SearchState(
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      searchText: searchText ?? this.searchText,
      searchParam: searchParams ?? this.searchParam,
      showCategoryDialog: showCategoryDialog ?? this.showCategoryDialog,
      paging: paging ?? this.paging,
      categories: categories ?? this.categories,
    );
  }
}
