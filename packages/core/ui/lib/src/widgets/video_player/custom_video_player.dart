import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

// Helper class to pass video state between normal and full screen modes
class VideoState {
  final Duration position;
  final bool isPlaying;

  VideoState(this.position, this.isPlaying);
}

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final double? width;
  final double? height;
  final double radius;
  final bool isFullScreen;
  final Duration? initialPosition;
  final bool? initialIsPlaying;
  final bool autoPlay;

  const CustomVideoPlayer({
    super.key,
    required this.videoUrl,
    this.width,
    this.height,
    this.radius = 0.0,
    this.isFullScreen = false,
    this.initialPosition,
    this.initialIsPlaying,
    this.autoPlay = false,
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late final player = Player();
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Media('https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Video(
          controller: controller,
        ),
      ),
    );
  }
}
