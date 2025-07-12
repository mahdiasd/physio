const int defaultPageIndex = 1;

class Paging<T> {
  final List<T> content;
  final int page;
  final int totalPages;
  final int totalItems;
  final int pageItemCount;
  final bool isFirst;
  final bool isLast;
  final bool isRefreshing;
  final bool isLoadMore;
  final bool apiErrorHappened;

  const Paging({
    required this.content,
    this.page = defaultPageIndex,
    this.totalPages = 0,
    this.totalItems = 0,
    this.pageItemCount = 0,
    this.isFirst = false,
    this.isLast = false,
    this.isRefreshing = false,
    this.isLoadMore = false,
    this.apiErrorHappened = false,
  });

  Paging<T> copyWith({
    List<T>? content,
    int? page,
    int? totalPages,
    int? totalItems,
    int? pageItemCount,
    bool? isFirst,
    bool? isLast,
    bool? isRefreshing,
    bool? isLoadMore,
    bool? apiErrorHappened,
  }) {
    return Paging<T>(
      content: content ?? this.content,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
      pageItemCount: pageItemCount ?? this.pageItemCount,
      isFirst: isFirst ?? this.isFirst,
      isLast: isLast ?? this.isLast,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      apiErrorHappened: apiErrorHappened ?? this.apiErrorHappened,
    );
  }
}

extension PagingExtensions<T> on Paging<T> {
  Paging<T> addMore(Paging<T> paging) {
    return paging.copyWith(
      content: (page == defaultPageIndex) ? paging.content : (List<T>.from(content)..addAll(paging.content)),
      isLoadMore: false,
      isRefreshing: false,
    );
  }

  Paging<T> nextPage() {
    return copyWith(apiErrorHappened: false, isRefreshing: false, isLoadMore: true, page: page + 1);
  }

  Paging<T> firstPage() {
    return copyWith(apiErrorHappened: false, isRefreshing: true, isLoadMore: false, page: defaultPageIndex);
  }

  Paging<T> errorHappened() {
    return copyWith(isRefreshing: false, isLoadMore: false, page: (page > defaultPageIndex) ? page - 1 : page, apiErrorHappened: true);
  }
}
