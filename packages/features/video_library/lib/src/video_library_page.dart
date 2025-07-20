import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';
import 'package:video_library/src/bloc/video_library_bloc.dart';
import 'package:video_library/src/bloc/video_library_effect.dart';

import 'bloc/video_library_event.dart';
import 'bloc/video_library_state.dart';

class VideoLibraryPage extends StatelessWidget {
  final void Function(SearchParams searchParams) navigateToSearch;
  final ValueChanged<String> navigateToVideoDetail;

  const VideoLibraryPage({super.key, required this.navigateToSearch, required this.navigateToVideoDetail});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VideoLibraryBloc>();
    return BlocListener<VideoLibraryBloc, VideoLibraryState>(
      listener: (context, state) {},
      child: BlocListenerWidget(
        effectsStream: bloc.effectsStream,
        messageStream: bloc.messageStream,
        effectHandlers: {
          NavigateToVideoDetail: (effect) {
            if (effect is NavigateToVideoDetail) {
              navigateToVideoDetail(effect.videoId);
            }
          },
          NavigateToSearch: (effect) {
            if (effect is NavigateToSearch) {
              navigateToSearch(effect.searchParams);
            }
          },
        },
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: LibraryContent(),
        ),
      ),
    );
  }
}

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: Padding(
          padding: EdgeInsets.only(left: isMobile ? 16 : 0, right: isMobile ? 16 : 0, top: isMobile ? 16 : 0),
          child: SingleChildScrollView(
            child: Column(
              spacing: isMobile ? 16 : 30,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                if (isMobile) ...[
                  _buildMainVideoSection(),
                ],
                _buildCategoriesLayout(),
                _buildRecentVideosLayout(),
                _buildMostViewedVideosLayout(),
                _buildShouldersVideosLayout(),
                _buildBlogPostsLayout(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final theme = Theme.of(context);

    if (isMobile) {
      return _buildSearchBar(context);
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageTitleText(
            "Library",
            color: theme.colorScheme.primary,
          ),
          const Spacer(),
          SizedBox(
            width: 400,
            child: _buildSearchBar(context),
          ),
        ],
      );
    }
  }

  Widget _buildSearchBar(BuildContext context) {
    final bloc = context.read<VideoLibraryBloc>();
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      height: isMobile ? 48 : 38,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: ClickableWidget(
        onTap: () => bloc.add(OnSearchClick()),
        child: Row(
          children: [
            Expanded(
              child: BodyText(
                'Search videos, pains, or body parts',
                color: Theme.of(context).customColors.placeholder,
              ),
            ),
            Container(
              height: 38,
              width: 1,
              color: Theme.of(context).colorScheme.outline,
              margin: const EdgeInsets.symmetric(horizontal: 12),
            ),
            AppImage(width: 24, height: 24, tintColor: Theme.of(context).colorScheme.primary, source: "assets/images/ic_search.svg")
          ],
        ),
      ),
    );
  }

  Widget _buildMainVideoSection() {
    return BlocBuilder<VideoLibraryBloc, VideoLibraryState>(
      builder: (context, state) {
        final mainVideo = state.library?.mainVideo;
        if (mainVideo == null) {
          return const SizedBox.shrink();
        }

        final bloc = context.read<VideoLibraryBloc>();

        return VideoItem(
          video: mainVideo,
          onTap: () => bloc.add(OnVideoClick(mainVideo)),
        );
      },
    );
  }

  Widget _buildCategoriesLayout() {
    return BlocBuilder<VideoLibraryBloc, VideoLibraryState>(
      builder: (context, state) {
        final categories = state.library?.categories ?? [];
        final bloc = context.read<VideoLibraryBloc>();
        final isMobile = ResponsiveBreakpoints.of(context).isMobile;

        return SizedBox(
          width: double.infinity,
          child: Column(
            spacing: isMobile ? 10 : 22,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableWidget(
                    child: ListTitleText('Categories'),
                    onTap: () => bloc.add(OnMoreCategoriesClick()),
                  ),
                ],
              ),
              ResponsiveHorizontalList<String>(
                height: 50,
                items: categories,
                itemSpacing: 13,
                emptyStateWidget: const SizedBox.shrink(),
                itemBuilder: (context, category, _) {
                  return CategoryItem(
                    title: category,
                    onTap: () => context.read<VideoLibraryBloc>().add(OnSelectCategory(category)),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRecentVideosLayout() {
    return BlocBuilder<VideoLibraryBloc, VideoLibraryState>(
      builder: (context, state) {
        final videos = state.library?.recentVideos ?? [];
        if (videos.isEmpty) return const SizedBox.shrink();

        final bloc = context.read<VideoLibraryBloc>();

        return SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableWidget(
                    child: ListTitleText('Recent Videos:'),
                    onTap: () => bloc.add(OnMoreRecentVideosClick()),
                  ),
                  ClickableWidget(
                      borderRadius: Theme.of(context).radius.fullAll,
                      onTap: () => bloc.add(OnMoreRecentVideosClick()),
                      child: AppImage(width: 20, height: 20, rotationAngle: 180, source: "assets/images/ic_arrow.svg"))
                ],
              ),
              ResponsiveHorizontalList<VideoSummary>(
                items: videos,
                itemSpacing: 36,
                emptyStateWidget: const SizedBox.shrink(),
                itemBuilder: (context, video, _) {
                  return VideoItem(
                    video: video,
                    aspectRatio: 1.7,
                    maxWidth: getVideoItemWidth(context),
                    onTap: () => bloc.add(OnVideoClick(video)),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMostViewedVideosLayout() {
    return BlocBuilder<VideoLibraryBloc, VideoLibraryState>(
      builder: (context, state) {
        final videos = state.library?.mostVideos ?? [];
        if (videos.isEmpty) return const SizedBox.shrink();

        final isMobile = ResponsiveBreakpoints.of(context).isMobile;
        final bloc = context.read<VideoLibraryBloc>();

        return SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableWidget(
                    child: ListTitleText('Most Viewed Videos:'),
                    onTap: () => bloc.add(OnMoreRecentVideosClick()),
                  ),
                  ClickableWidget(
                      borderRadius: Theme.of(context).radius.fullAll,
                      onTap: () => bloc.add(OnMoreRecentVideosClick()),
                      child: AppImage(width: 20, height: 20, rotationAngle: 180, source: "assets/images/ic_arrow.svg"))
                ],
              ),
              ResponsiveHorizontalList<VideoSummary>(
                items: videos,
                emptyStateWidget: const SizedBox.shrink(),
                itemBuilder: (context, video, _) {
                  return VideoItem(
                    video: video,
                    aspectRatio: 1.7,
                    maxWidth: getVideoItemWidth(context) - (isMobile ? 70 : 0),
                    onTap: () => bloc.add(OnVideoClick(video)),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShouldersVideosLayout() {
    return BlocBuilder<VideoLibraryBloc, VideoLibraryState>(
      builder: (context, state) {
        final videos = state.library?.shouldersVideos ?? [];
        if (videos.isEmpty) return const SizedBox.shrink();
        final isMobile = ResponsiveBreakpoints.of(context).isMobile;
        final bloc = context.read<VideoLibraryBloc>();

        return SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableWidget(
                    child: ListTitleText('Shoulders'),
                    onTap: () => bloc.add(OnMoreRecentVideosClick()),
                  ),
                  ClickableWidget(
                      borderRadius: Theme.of(context).radius.fullAll,
                      onTap: () => bloc.add(OnMoreRecentVideosClick()),
                      child: AppImage(width: 20, height: 20, rotationAngle: 180, source: "assets/images/ic_arrow.svg"))
                ],
              ),
              ResponsiveHorizontalList<VideoSummary>(
                items: videos,
                emptyStateWidget: const SizedBox.shrink(),
                itemBuilder: (context, video, _) {
                  return VideoItem(
                    video: video,
                    aspectRatio: 1.7,
                    maxWidth: getVideoItemWidth(context) - (isMobile ? 70 : 0),
                    onTap: () => bloc.add(OnVideoClick(video)),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBlogPostsLayout() {
    return BlocBuilder<VideoLibraryBloc, VideoLibraryState>(
      builder: (context, state) {
        final posts = state.library?.blogPosts ?? [];
        if (posts.isEmpty) return const SizedBox.shrink();

        final bloc = context.read<VideoLibraryBloc>();

        return SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableWidget(
                    child: ListTitleText('Blog Posts:'),
                    onTap: () => bloc.add(OnMoreRecentVideosClick()),
                  ),
                  ClickableWidget(
                      borderRadius: Theme.of(context).radius.fullAll,
                      onTap: () => bloc.add(OnMoreBlogPostClick()),
                      child: AppImage(width: 20, height: 20, rotationAngle: 180, source: "assets/images/ic_arrow.svg"))
                ],
              ),
              ResponsiveHorizontalList<BlogPost>(
                items: posts,
                emptyStateWidget: const SizedBox.shrink(),
                itemBuilder: (context, post, _) {
                  return BlogPostItem(
                    post: post,
                    aspectRatio: 1.7,
                    maxWidth: getVideoItemWidth(context),
                    onTap: () => bloc.add(OnBlogPostClick(post)),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  double getVideoItemWidth(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile ? 170 : 170;
  }
}
