import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart' hide VideoState;
import 'package:utils/utils.dart';

import '../video_detail.dart';
import 'bloc/video_detail_effect.dart';
import 'bloc/video_detail_event.dart';
import 'bloc/video_detail_state.dart';

class VideoDetailPage extends StatelessWidget {
  final VoidCallback navigateBack;
  final ValueChanged<NavigationItem> onSidebarClick;
  final ValueChanged<String> navigateToVideoDetail;

  const VideoDetailPage({
    super.key,
    required this.navigateBack,
    required this.onSidebarClick,
    required this.navigateToVideoDetail,
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
        NavigateToVideoDetail: (effect) => navigateToVideoDetail((effect as NavigateToVideoDetail).videoId),
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
  final GlobalKey<VideoState> videoKey = GlobalKey<VideoState>();

  @override
  void initState() {
    super.initState();
  }

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
            _buildVideoDetail(context, context.read<VideoDetailBloc>().player, context.read<VideoDetailBloc>().controller),
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
                _buildVideoDetail(context, context.read<VideoDetailBloc>().player, context.read<VideoDetailBloc>().controller),
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

  Widget _buildVideoDetail(BuildContext context, Player player, VideoController controller) {
    return BlocBuilder<VideoDetailBloc, VideoDetailState>(
      buildWhen: (previous, current) => previous.video?.videoFile.s3Url != current.video?.videoFile.s3Url,
      builder: (context, state) {
        if (state.video != null && (player.state.playlist.medias.isEmpty || player.state.playlist.medias.first.uri != state.video!.videoFile.s3Url)) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            PrintHelper.info(state.video!.videoFile.s3Url, location: "open");
            player.open(Media(state.video!.videoFile.s3Url));
          });
        }

        if (state.video == null) {
          return AspectRatio(
            aspectRatio: 1.7,
            child: SizedBox(),
          );
        } else
          return AspectRatio(
            aspectRatio: 1.7,
            child: BasicVideoPlayer(
              player: player,
              controller: controller,
              key: ValueKey(state.video?.videoFile.s3Url),
            ),
            // child: SizedBox(),
          );
      },
    );
  }

  Widget _buildVideoInfo(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return BlocBuilder<VideoDetailBloc, VideoDetailState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                  color: theme.customColors.helper,
                ),
              ],
            ),
            AppImage(
              width: 20,
              height: 20,
              source: "assets/images/ic_flag.svg",
              onTap: () {
                context.read<VideoDetailBloc>().add(FlagPressed());
              },
              tintColor: theme.customColors.disabled,
            )
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
      buildWhen: (previous, current) => previous.video?.relatedVideos != current.video?.relatedVideos,
      builder: (context, state) {
        final isMobile = ResponsiveBreakpoints.of(context).isMobile;
        if (state.video?.relatedVideos == null || state.video!.relatedVideos.isEmpty) {
          return SizedBox.shrink();
        }
        return SingleChildScrollView(
          child: Column(
            spacing: isMobile ? 16 : 28,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTitleText("Related Videos:"),
              if (isMobile)
                ...?state.video?.relatedVideos
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
                  itemCount: state.video!.relatedVideos.length,
                  itemBuilder: (context, index) {
                    final video = state.video!.relatedVideos[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, right: 48),
                      child: VideoItem(video: video, onTap: () => context.read<VideoDetailBloc>().add(OnRelatedVideoClick(video))),
                    );
                  },
                )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    PrintHelper.info("dispose", location: "VideoDetail");
    super.dispose();
  }
}
