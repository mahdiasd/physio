import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:utils/utils.dart';
class BasicVideoPlayer extends StatefulWidget {
  final double? height;
  final double? width;
  final Player player;
  final VideoController controller;

  const BasicVideoPlayer({
    super.key,
    this.height,
    this.width,
    required this.player,
    required this.controller,
  });

  @override
  _BasicVideoPlayerState createState() => _BasicVideoPlayerState();
}

class _BasicVideoPlayerState extends State<BasicVideoPlayer> with AutomaticKeepAliveClientMixin {
  StreamSubscription<String>? _errorSubscription;
  StreamSubscription<PlayerLog>? _logSubscription;

  @override
  bool get wantKeepAlive => true; // Keep widget alive during rebuilds

  @override
  void initState() {
    super.initState();

    PrintHelper.info("initState → BasicVideoPlayer", location: "VideoPlayer");

    // Listen to player errors and log them
    _errorSubscription = widget.player.stream.error.listen((error) {
      PrintHelper.error("VideoPlayer Error: $error", location: "VideoPlayer");
    });

    // Optional: Listen to internal logs for more debugging info
    _logSubscription = widget.player.stream.log.listen((log) {
      PrintHelper.info("VideoPlayer Log: $log", location: "VideoPlayer");
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    return Video(
      controller: widget.controller,
      fit: BoxFit.contain,
      fill: Colors.black,
    );
  }

  @override
  void dispose() {
    PrintHelper.info("dispose", location: "VideoPlayer");
    _errorSubscription?.cancel();
    _logSubscription?.cancel();
    // Don't dispose player here - it's managed by parent widget
    super.dispose();
  }
}