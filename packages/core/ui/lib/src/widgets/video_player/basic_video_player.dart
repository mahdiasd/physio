import 'dart:io'; // For platform checking (e.g., for spinner if needed)
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:ui/src/theme/custom_colors.dart';
import 'package:video_player/video_player.dart';

class BasicVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const BasicVideoPlayer({
    super.key,
    required this.videoUrl,
  });

  @override
  _BasicVideoPlayerState createState() => _BasicVideoPlayerState();
}

class _BasicVideoPlayerState extends State<BasicVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
      );

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error initializing video: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Video Player')),
      body: Center(
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: Theme.of(context).radius.smallAll),
                child: Chewie(controller: _chewieController!),
              )
            : const CircularProgressIndicator(color: Colors.black),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
