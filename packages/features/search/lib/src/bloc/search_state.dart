import 'package:domain/domain.dart';
import 'package:ui/ui.dart';

class SearchState {
  final bool isRefreshing;
  final bool isLoadMore;
  final bool showCategoryDialog;
  final SearchParams? searchParams;
  final String searchText;
  final Paging<VideoSummary> paging;
  final List<String> categories;

  const SearchState({
    this.isRefreshing = false,
    this.isLoadMore = false,
    this.searchParams = null,
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
    Paging<VideoSummary>? paging,
    List<String>? categories,
  }) {
    return SearchState(
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      searchText: searchText ?? this.searchText,
      searchParams: searchParams ?? this.searchParams,
      showCategoryDialog: showCategoryDialog ?? this.showCategoryDialog,
      paging: paging ?? this.paging,
      categories: categories ?? this.categories,
    );
  }
}
