import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import '../video_detail.dart';
import 'bloc/video_detail_effect.dart';
import 'bloc/video_detail_state.dart';

class VideoDetailPage extends StatelessWidget {
  final VoidCallback navigateBack;
  final ValueChanged<NavigationItem> onSidebarClick;

  const VideoDetailPage({
    super.key,
    required this.navigateBack,
    required this.onSidebarClick,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VideoDetailBloc>();
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: (_) => navigateBack(),
      },
      child: isMobile
          ? VideoDetailContent()
          : WebSidebar(
              child: VideoDetailContent(),
              onItemTapped: onSidebarClick,
            ),
    );
  }
}

class VideoDetailContent extends StatefulWidget {
  const VideoDetailContent({super.key});

  @override
  State<VideoDetailContent> createState() => _VideoDetailContentState();
}

class _VideoDetailContentState extends State<VideoDetailContent> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0, bottom: 8),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVideoDetail(context),
            _buildVideoInfo(context),
            _buildTags(context),
            _buildDescription(context),
            _buildRelatedVideosSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 58,
      children: [
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVideoDetail(context),
                const SizedBox(height: 24),
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
          width: 170,
          child: _buildRelatedVideosSection(context),
        ),
      ],
    );
  }

  Widget _buildVideoDetail(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = width / 1.7;
        return SizedBox(
          width: width,
          height: height,
          child: Container(decoration: BoxDecoration(color: Theme.of(context).colorScheme.outline)),
        );
      },
    );
  }

  Widget _buildVideoInfo(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return BlocBuilder<VideoDetailBloc, VideoDetailState>(
      builder: (context, state) {
        return Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isMobile)
              ListItemTitleText(
                state.video?.title ?? "Video Name",
                color: theme.colorScheme.onSurface,
              )
            else
              PageSubTitleText(
                state.video?.title ?? "Video Name",
                color: theme.colorScheme.onSurface,
              ),
            BodyLargeText(
              state.video?.category ?? "Category",
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        );
      },
    );
  }

  Widget _buildTags(BuildContext context) {
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
        color: theme.colorScheme.secondary,
        borderRadius: theme.radius.largeAll,
      ),
      child: BottomNavigationText(
        text,
        color: theme.colorScheme.onSecondary,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return BlocBuilder<VideoDetailBloc, VideoDetailState>(
      builder: (context, state) {
        return BodyText(
          state.video?.description ??
              "This gentle pelvic tilt exercise is designed to relieve lower back tension and improve spinal mobility. Ideal for beginners, it helps activate the deep core muscles that support your spine, making it perfect for those experiencing stiffness from prolonged sitting or mild back discomfort.",
        );
      },
    );
  }

  Widget _buildRelatedVideosSection(BuildContext context) {
    return BlocBuilder<VideoDetailBloc, VideoDetailState>(
      buildWhen: (previous, current) => previous.relatedVideos != current.relatedVideos,
      builder: (context, state) {
        final isMobile = ResponsiveBreakpoints.of(context).isMobile;

        return SingleChildScrollView(
          child: Column(
            spacing: isMobile ? 16 : 28,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTitleText("Related Videos:"),
              if (isMobile)
                ...state.relatedVideos
                    .map((video) => Column(
                          spacing: 16,
                          children: [
                            VideoItemHorizontal(video: video),
                            Divider(
                              height: 1,
                              thickness: 0.5,
                              color: Theme.of(context).colorScheme.outline,
                            )
                          ],
                        ))
                    .toList()
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.relatedVideos.length,
                  itemBuilder: (context, index) {
                    final video = state.relatedVideos[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, right: 48),
                      child: VideoItem(video: video),
                    );
                  },
                )
            ],
          ),
        );
      },
    );
  }
}
