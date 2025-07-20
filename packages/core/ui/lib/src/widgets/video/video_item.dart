import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../ui.dart';

class VideoItem extends StatelessWidget {
  final VideoSummary video;
  final VoidCallback? onTap;
  final double aspectRatio;
  final double? maxWidth;

  const VideoItem({
    super.key,
    required this.video,
    this.onTap,
    this.aspectRatio = 2,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: theme.radius.smallAll,
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: AppImage(
              source: video.coverPhoto,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListItemTitleText(
                video.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              ListItemSubtitleText(
                video.category,
                maxLines: 1,
                color: Theme.of(context).customColors.helper,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );

    if (maxWidth != null) {
      content = Container(
        constraints: BoxConstraints(maxWidth: maxWidth!),
        child: content,
      );
    }

    return ClickableWidget(
      onTap: onTap,
      borderRadius: theme.radius.largeAll,
      enableHoverEffect: true,
      child: content,
    );
  }
}

class VideoItemHorizontal extends StatelessWidget {
  final VideoSummary video;
  final VoidCallback? onTap;
  final double imageWidth;
  final double aspectRatio;
  final double? maxHeight;

  const VideoItemHorizontal({
    super.key,
    required this.video,
    this.onTap,
    this.aspectRatio = 1.7,
    this.imageWidth = 120, // Default width for the image
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget content = Row(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: theme.radius.smallAll,
          child: SizedBox(
            width: imageWidth,
            height: imageWidth / aspectRatio, // 1.5 aspect ratio for image height
            child: AppImage(
              radius: theme.radius.large,
              source: video.coverPhoto,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListItemTitleText(
              video.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            ListItemSubtitleText(
              video.category,
              maxLines: 1,
              color: Theme.of(context).customColors.helper,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );

    // Apply height constraint if needed
    if (maxHeight != null) {
      content = Container(
        constraints: BoxConstraints(maxHeight: maxHeight!),
        child: content,
      );
    }

    // Apply clickability with hover effect
    return ClickableWidget(
      onTap: onTap,
      borderRadius: theme.radius.largeAll,
      enableHoverEffect: true,
      child: content,
    );
  }
}
