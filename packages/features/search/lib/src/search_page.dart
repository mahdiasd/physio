import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import 'bloc/search_bloc.dart';
import 'bloc/search_effect.dart';
import 'bloc/search_event.dart';
import 'bloc/search_state.dart';

class SearchPage extends StatelessWidget {
  final VoidCallback navigateBack;
  final ValueChanged<NavigationItem> onSidebarClick;
  final ValueChanged<String> navigateToVideoDetail;

  const SearchPage({
    super.key,
    required this.navigateBack,
    required this.onSidebarClick,
    required this.navigateToVideoDetail,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchBloc>();
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return BlocListener<SearchBloc, SearchState>(
      listener: (BuildContext context, state) {
        if (state.showCategoryDialog) {
          showAdaptiveDialog<void>(
            context: context,
            builder: (context) {
              return CategoryDialog(
                categories: state.categories,
                onCategorySelected: (category) =>
                    bloc.add(CategorySelected(category)),
              );
            },
          );
        }
      },
      child: BlocListenerWidget(
        effectsStream: bloc.effectsStream,
        messageStream: bloc.messageStream,
        effectHandlers: {
          NavigateBack: (_) => navigateBack(),
          NavigateToVideoDetail: (effect) =>
              navigateToVideoDetail((effect as NavigateToVideoDetail).videoId),
        },
        child: isMobile
            ? SafeArea(child: SearchContent())
            : WebSidebar(
                child: SearchContent(),
                onItemTapped: onSidebarClick,
              ),
      ),
    );
  }
}

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: _buildGridLists(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final theme = Theme.of(context);

    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: _buildSearchBar(context),
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PageTitleText(
            "Search Result",
            color: theme.colorScheme.primary,
          ),
          SizedBox(
            width: 400,
            child: _buildSearchBar(context),
          ),
        ],
      );
    }
  }

  Widget _buildSearchBar(BuildContext context) {
    final bloc = context.read<SearchBloc>();
    final theme = Theme.of(context);

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Row(
          children: [
            AppImage(
              source: "assets/images/ic_filter.svg",
              backgroundColor: theme.colorScheme.secondaryContainer,
              radius: theme.radius.full,
              backgroundPadding: const EdgeInsetsGeometry.all(8),
              tintColor: theme.colorScheme.secondary,
              onTap: () => bloc.add(ShowCategoryDialog(true)),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                child: AppTextField(
                  value: state.searchText,
                  contentPadding: const EdgeInsetsGeometry.all(12),
                  borderRadius: theme.radius.xxLargeAll,
                  hint: "Search videos, pains, or body parts",
                  maxLines: 1,
                  trailingIcon: SizedBox(
                    width: 50,
                    child: Row(
                      children: [
                        Container(
                          height: 38,
                          width: 1,
                          color: Theme.of(context).colorScheme.outline,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        AppImage(
                          width: 24,
                          height: 24,
                          tintColor: Theme.of(context).colorScheme.primary,
                          source: "assets/images/ic_search.svg",
                          onTap: () {
                            bloc.add(OnRefresh());
                          },
                        )
                      ],
                    ),
                  ),
                  onChanged: (text) {
                    bloc.add(SearchTextChanged(text));
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGridLists(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final width = MediaQuery.of(context).size.width;

    final bloc = context.read<SearchBloc>();
    final gridCount = isMobile ? 1 : (width / 190).toInt();

    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return previous.paging != current.paging;
      },
      builder: (context, state) {
        if (!isMobile) {
          return PaginatedGridView<VideoSummary>(
            paging: state.paging,
            itemBuilder: (context, item, index) {
              return VideoItem(
                maxWidth: 170,
                aspectRatio: 1.7,
                video: item,
                onTap: () => bloc.add(OnVideoClick(item)),
              );
            },
            onRefresh: () async {
              bloc.add(OnRefresh());
            },
            onLoadMore: () async {
              bloc.add(OnLoadMore());
            },
            crossAxisCount: gridCount,
          );
        } else {
          return PaginatedListView(
            paging: state.paging,
            itemBuilder: (context, item, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: VideoItemHorizontal(
                  maxHeight: 120,
                  aspectRatio: 1.7,
                  video: item,
                  onTap: () => bloc.add(OnVideoClick(item)),
                ),
              );
            },
            onRefresh: () async {
              bloc.add(OnRefresh());
            },
            onLoadMore: () async {
              bloc.add(OnLoadMore());
            },
          );
        }
      },
    );
  }
}

class CategoryDialog extends StatelessWidget {
  final List<String> categories;
  final ValueChanged<String> onCategorySelected;

  const CategoryDialog({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      title: const TitleMediumText("Select Category"),
      content: SingleChildScrollView(
        child: ListBody(
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CategoryItem(
                title: category,
                onTap: () => onCategorySelected(category),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
