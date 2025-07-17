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
        child: LibraryContent(),
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

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: isMobile ? 16 : 0, horizontal: isMobile ? 16 : 0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
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
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final theme = Theme.of(context);

    if (isMobile) {
      // Mobile: Full width search bar
      return _buildSearchBar(context);
    } else {
      // Web: Row with Library title and search bar
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineMediumText(
            "Library",
            color: theme.colorScheme.primary,
          ),
          const Spacer(),
          SizedBox(
            width: 400, // Limited width for web search bar
            child: _buildSearchBar(context),
          ),
        ],
      );
    }
  }

  Widget _buildSearchBar(BuildContext context) {
    final bloc = context.read<VideoLibraryBloc>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.search,
              color: Colors.grey[600],
              size: 20,
            ),
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

        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableWidget(
                    child: TitleSmallText('Categories'),
                    onTap: () => bloc.add(OnMoreCategoriesClick()),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ResponsiveHorizontalList<VideoCategory>(
                height: 50,
                items: categories,
                emptyStateWidget: const SizedBox.shrink(),
                itemBuilder: (context, category, _) {
                  return CategoryItem(
                    title: category.name,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableWidget(
                    child: TitleSmallText('Recent Videos:'),
                    onTap: () => bloc.add(OnMoreRecentVideosClick()),
                  ),
                  SizedBox(
                      width: 24,
                      height: 24,
                      child: ClickableWidget(
                        onTap: () => bloc.add(OnMoreRecentVideosClick()),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 8),
              ResponsiveHorizontalList<Video>(
                items: videos,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableWidget(
                    child: TitleSmallText('Most Viewed Videos:'),
                    onTap: () => bloc.add(OnMoreRecentVideosClick()),
                  ),
                  SizedBox(
                      width: 24,
                      height: 24,
                      child: ClickableWidget(
                        onTap: () => bloc.add(OnMoreMostViewedVideosClick()),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 8),
              ResponsiveHorizontalList<Video>(
                items: videos,
                emptyStateWidget: const SizedBox.shrink(),
                itemBuilder: (context, video, _) {
                  return VideoItem(
                    video: video,
                    aspectRatio: 1.7,
                    maxWidth: getVideoItemWidth(context) - (isMobile ? 50 : 0),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableWidget(
                    child: TitleSmallText('Shoulders'),
                    onTap: () => bloc.add(OnMoreRecentVideosClick()),
                  ),
                  SizedBox(
                      width: 24,
                      height: 24,
                      child: ClickableWidget(
                        onTap: () => bloc.add(OnMoreShouldersVideosClick()),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 8),
              ResponsiveHorizontalList<Video>(
                items: videos,
                emptyStateWidget: const SizedBox.shrink(),
                itemBuilder: (context, video, _) {
                  return VideoItem(
                    video: video,
                    aspectRatio: 1.7,
                    maxWidth: getVideoItemWidth(context) - (isMobile ? 50 : 0),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableWidget(
                    child: TitleSmallText('Blog Posts:'),
                    onTap: () => bloc.add(OnMoreRecentVideosClick()),
                  ),
                  SizedBox(
                      width: 24,
                      height: 24,
                      child: ClickableWidget(
                        onTap: () => bloc.add(OnMoreBlogPostClick()),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 8),
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
    return ResponsiveBreakpoints.of(context).isMobile ? 150 : 250;
  }
}
