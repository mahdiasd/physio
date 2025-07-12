import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'package:responsive_framework/responsive_framework.dart';

import '../video_player.dart';
import 'bloc/video_detail_effect.dart';
import 'bloc/video_detail_state.dart';

class VideoDetailPage extends StatelessWidget {
  final VoidCallback navigateBack;

  const VideoDetailPage({
    super.key,
    required this.navigateBack,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VideoDetailBloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: (_) => navigateBack(),
      },
      child: VideoDetailContent(),
    );
  }
}

class VideoDetailContent extends StatefulWidget {
  const VideoDetailContent({super.key});

  @override
  State<VideoDetailContent> createState() => _VideoDetailContentState();
}

class _VideoDetailContentState extends State<VideoDetailContent> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // TODO: Initialize video controller based on video URL from state
    _initializeVideo();
  }

  void _initializeVideo() {
    // This is a placeholder - replace with actual video URL from state
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    )..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: isMobile
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildVideoDetail(context),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVideoInfo(context),
                const SizedBox(height: 16),
                _buildTags(context),
                const SizedBox(height: 24),
                _buildDescription(context),
                const SizedBox(height: 24),
                _buildRelatedVideosSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main content area
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadlineMediumText(
                      "Search Result",
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Video player
                _buildVideoDetail(context),
                const SizedBox(height: 24),
                // Video info
                _buildVideoInfo(context),
                const SizedBox(height: 16),
                _buildTags(context),
                const SizedBox(height: 24),
                _buildDescription(context),
              ],
            ),
          ),
        ),
        // Related videos sidebar
        Container(
          width: 320,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: theme.colorScheme.outlineVariant,
                width: 1,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleLargeText("Related Videos"),
                    Icon(
                      Icons.chevron_right,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _buildRelatedVideosList(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVideoDetail(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: theme.radius.largeAll,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.black,
          child: _isInitialized && _controller != null
              ? VideoPlayer(_controller!)
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  Widget _buildVideoInfo(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<VideoDetailBloc, VideoDetailState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadlineMediumText(
              state.video?.title ?? "Video Name",
              color: theme.colorScheme.onSurface,
            ),
            const SizedBox(height: 8),
            BodyMediumText(
              state.video?.category.name ?? "Category",
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        );
      },
    );
  }

  Widget _buildTags(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildTag(context, "Tag"),
        _buildTag(context, "Tag"),
        _buildTag(context, "Tag"),
      ],
    );
  }

  Widget _buildTag(BuildContext context, String text) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: theme.radius.largeAll,
      ),
      child: BodySmallText(
        text,
        color: theme.colorScheme.onPrimaryContainer,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<VideoDetailBloc, VideoDetailState>(
      builder: (context, state) {
        return BodyMediumText(
          state.video?.description ??
              "This gentle pelvic tilt exercise is designed to relieve lower back tension and improve spinal mobility. Ideal for beginners, it helps activate the deep core muscles that support your spine, making it perfect for those experiencing stiffness from prolonged sitting or mild back discomfort.",
          color: theme.colorScheme.onSurfaceVariant,
        );
      },
    );
  }

  Widget _buildRelatedVideosSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleLargeText("Related Videos:"),
        const SizedBox(height: 16),
        _buildRelatedVideosList(context),
      ],
    );
  }

  Widget _buildRelatedVideosList(BuildContext context) {
    final relatedVideos = FakeDataProvider.instance.getFakeVideos(count: 5);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: relatedVideos.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return VideoItemHorizontal(
          video: relatedVideos[index],
          imageWidth: 100,
          aspectRatio: 1.7,
          onTap: () {
            // Navigate to video
          },
        );
      },
    );
  }
}
