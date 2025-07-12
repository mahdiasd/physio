import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../ui.dart';

class VideoItem extends StatelessWidget {
  final Video video;
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
          borderRadius: theme.radius.largeAll,
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: AppImage(
              source: video.thumbnail,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListItemTitleText(
                video.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              ListItemSubtitleText(
                video.category.name,
                maxLines: 1,
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

    // استفاده از ClickableWidget
    return ClickableWidget(
      onTap: onTap,
      borderRadius: theme.radius.largeAll,
      enableHoverEffect: true,
      child: content,
    );
  }
}
