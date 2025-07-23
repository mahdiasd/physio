import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:utils/utils.dart';

class BasicVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final double? height;
  final double? width;

  const BasicVideoPlayer({
    super.key,
    required this.videoUrl,
    this.height,
    this.width,
  });

  @override
  _BasicVideoPlayerState createState() => _BasicVideoPlayerState();
}

class _BasicVideoPlayerState extends State<BasicVideoPlayer> {
  late final player = Player();
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Media(widget.videoUrl));
    PrintHelper.info("initState", location: "VideoPlayer");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Video(controller: controller),
      ),
    );
  }

  @override
  void dispose() {
    PrintHelper.info("dispose", location: "VideoPlayer");
    player.dispose();
    super.dispose();
  }
}
