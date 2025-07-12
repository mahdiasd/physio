import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

typedef ItemBuilder<T> = Widget Function(BuildContext context, T item, int index);

class PaginatedGridView<T> extends StatefulWidget {
  final Paging<T> paging;
  final ItemBuilder<T> itemBuilder;
  final RefreshCallback onRefresh;
  final VoidCallback? onLoadMore;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final ScrollPhysics? physics;
  final EdgeInsets padding;
  final bool shrinkWrap;
  final ScrollController? controller;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? loadMoreWidget;
  final int loadMoreThreshold;

  const PaginatedGridView({
    super.key,
    required this.paging,
    required this.itemBuilder,
    required this.onRefresh,
    this.onLoadMore,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 16.0,
    this.crossAxisSpacing = 16.0,
    this.childAspectRatio = 1.0,
    this.physics,
    this.padding = const EdgeInsets.all(16.0),
    this.shrinkWrap = false,
    this.controller,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.loadMoreWidget,
    this.loadMoreThreshold = 5,
  });

  @override
  State<PaginatedGridView<T>> createState() => _PaginatedGridViewState<T>();
}

class _PaginatedGridViewState<T> extends State<PaginatedGridView<T>> {
  late ScrollController _scrollController;
  bool _hasScrollListener = false;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _setupScrollListener();
  }

  @override
  void didUpdateWidget(PaginatedGridView<T> oldWidget) {
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
    if (widget.paging.isLoadMore || widget.paging.isRefreshing || widget.paging.isLast) {
      return;
    }

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
    // اگر در حال لودینگ اولیه است
    if (widget.paging.isRefreshing && widget.paging.content.isEmpty) {
      return _buildLoadingView();
    }

    // اگر خطا رخ داده و محتوایی نداریم
    if (widget.paging.apiErrorHappened && widget.paging.content.isEmpty) {
      return _buildErrorView();
    }

    // اگر محتوا خالی است (بدون خطا)
    if (!widget.paging.isRefreshing && !widget.paging.apiErrorHappened && widget.paging.content.isEmpty) {
      return _buildEmptyView();
    }

    // نمایش گرید با محتوا
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: CustomScrollView(
        controller: _scrollController,
        physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: widget.padding,
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  if (index < widget.paging.content.length) {
                    return widget.itemBuilder(context, widget.paging.content[index], index);
                  }
                  return null;
                },
                childCount: widget.paging.content.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.crossAxisCount,
                mainAxisSpacing: widget.mainAxisSpacing,
                crossAxisSpacing: widget.crossAxisSpacing,
                childAspectRatio: widget.childAspectRatio,
              ),
            ),
          ),

          // نمایش لودمور در انتهای لیست
          if (widget.paging.isLoadMore)
            SliverToBoxAdapter(
              child: _buildLoadMoreView(),
            ),

          // نمایش خطا در لودمور
          if (widget.paging.apiErrorHappened && widget.paging.content.isNotEmpty)
            SliverToBoxAdapter(
              child: _buildLoadMoreErrorView(),
            ),

          // فضای خالی در انتها برای نمایش بهتر
          SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
        ],
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