import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

typedef ListViewItemBuilder<T> = Widget Function(BuildContext context, T item, int index);

class PaginatedListView<T> extends StatefulWidget {
  final Paging<T> paging;
  final ListViewItemBuilder<T> itemBuilder;
  final RefreshCallback onRefresh;
  final VoidCallback? onLoadMore;
  final ScrollPhysics? physics;
  final EdgeInsets padding;
  final bool shrinkWrap;
  final ScrollController? controller;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? loadMoreWidget;
  final int loadMoreThreshold;
  final Widget? separatorBuilder;
  final double? itemExtent;
  final bool addAutomaticKeepAlives;

  const PaginatedListView({
    super.key,
    required this.paging,
    required this.itemBuilder,
    required this.onRefresh,
    this.onLoadMore,
    this.physics,
    this.padding = const EdgeInsets.all(16.0),
    this.shrinkWrap = false,
    this.controller,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.loadMoreWidget,
    this.loadMoreThreshold = 5,
    this.separatorBuilder,
    this.itemExtent,
    this.addAutomaticKeepAlives = true,
  });

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  late ScrollController _scrollController;
  bool _hasScrollListener = false;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _setupScrollListener();
  }

  @override
  void didUpdateWidget(PaginatedListView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      if (_hasScrollListener) {
        _scrollController.removeListener(_onScroll);
      }

      _scrollController = widget.controller ?? ScrollController();
      _setupScrollListener();
    }

    if (oldWidget.onLoadMore != widget.onLoadMore) {
      if (_hasScrollListener) {
        _scrollController.removeListener(_onScroll);
        _hasScrollListener = false;
      }
      _setupScrollListener();
    }
  }

  void _setupScrollListener() {
    if (widget.onLoadMore != null && !_hasScrollListener) {
      _scrollController.addListener(_onScroll);
      _hasScrollListener = true;
    }
  }

  void _onScroll() {
    // Don't load more if we're already loading, refreshing or at the last page
    if (widget.paging.isLoadMore || widget.paging.isRefreshing || widget.paging.isLast) {
      return;
    }

    // Trigger load more when we're close to the bottom
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - widget.loadMoreThreshold * 100) {
      widget.onLoadMore?.call();
    }
  }

  @override
  void dispose() {
    if (_hasScrollListener && widget.controller == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Show loading view if we're refreshing and have no content
    if (widget.paging.isRefreshing && widget.paging.content.isEmpty) {
      return _buildLoadingView();
    }

    // Show error view if an error occurred and we have no content
    if (widget.paging.apiErrorHappened && widget.paging.content.isEmpty) {
      return _buildErrorView();
    }

    // Show empty view if we have no content (without error)
    if (!widget.paging.isRefreshing && !widget.paging.apiErrorHappened && widget.paging.content.isEmpty) {
      return _buildEmptyView();
    }

    // Show list with content
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: CustomScrollView(
        controller: _scrollController,
        physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Main list content
          SliverPadding(
            padding: widget.padding,
            sliver: widget.separatorBuilder != null
                ? _buildSliverListWithSeparator()
                : _buildSliverList(),
          ),

          // Load more indicator at the end of the list
          if (widget.paging.isLoadMore)
            SliverToBoxAdapter(
              child: _buildLoadMoreView(),
            ),

          // Error view for load more failures
          if (widget.paging.apiErrorHappened && widget.paging.content.isNotEmpty)
            SliverToBoxAdapter(
              child: _buildLoadMoreErrorView(),
            ),

          // Extra space at the bottom for better UX
          SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverList() {
    return widget.itemExtent != null
        ? SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          if (index < widget.paging.content.length) {
            return widget.itemBuilder(context, widget.paging.content[index], index);
          }
          return null;
        },
        childCount: widget.paging.content.length,
        addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      ),
      itemExtent: widget.itemExtent!,
    )
        : SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          if (index < widget.paging.content.length) {
            return widget.itemBuilder(context, widget.paging.content[index], index);
          }
          return null;
        },
        childCount: widget.paging.content.length,
        addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      ),
    );
  }

  Widget _buildSliverListWithSeparator() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final itemIndex = index ~/ 2;
          // Return separator for odd indices
          if (index.isOdd) {
            return widget.separatorBuilder;
          }

          // Return item for even indices if within range
          if (itemIndex < widget.paging.content.length) {
            return widget.itemBuilder(context, widget.paging.content[itemIndex], itemIndex);
          }
          return null;
        },
        childCount: widget.paging.content.isEmpty ? 0 : widget.paging.content.length * 2 - 1,
        addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      ),
    );
  }

  Widget _buildLoadingView() {
    return widget.loadingWidget ?? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading...'),
        ],
      ),
    );
  }

  Widget _buildErrorView() {
    return widget.errorWidget ?? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red),
          SizedBox(height: 16),
          Text('An error occurred.'),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: widget.onRefresh,
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyView() {
    return widget.emptyWidget ?? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('No items found'),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: widget.onRefresh,
            child: Text('Refresh'),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadMoreView() {
    return widget.loadMoreWidget ?? Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoadMoreErrorView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text('Failed to load more items'),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: widget.onLoadMore,
            child: Text('Try Again'),
          ),
        ],
      ),
    );
  }
}