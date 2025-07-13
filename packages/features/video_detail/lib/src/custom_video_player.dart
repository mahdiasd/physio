import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utils/utils.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utils/utils.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final BorderRadius? borderRadius;

  const CustomVideoPlayer({
    super.key,
    required this.videoUrl,
    this.borderRadius,
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    PrintHelper.info("Initializing video with URL: ${widget.videoUrl}");
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    )..initialize().then((_) {
      if (mounted) {
        PrintHelper.info("Video initialized: ${widget.videoUrl}");
        setState(() {
          _isInitialized = true;
        });
        Future<void>.delayed(const Duration(milliseconds: 300));
      }
    }).catchError((error) {
      PrintHelper.error("Error initializing video: $error");
    });
  }

  void _refreshVideo() {
    PrintHelper.info("Refreshing video state");
    setState(() {});
    _controller.play();
    PrintHelper.info("Video play called after refresh. Is playing: ${_controller.value.isPlaying}");
  }

  @override
  void dispose() {
    PrintHelper.info("Disposing video controller for URL: ${widget.videoUrl}");
    _controller.dispose();
    super.dispose();
  }

  void _toggleFullScreen() {
    PrintHelper.info("Toggling full screen. Current state: $_isFullScreen");
    if (_isFullScreen) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Navigator.of(context).pop();
      _refreshVideo();
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => FullScreenVideoPlayer(
            controller: _controller,
            onExitFullScreen: () {
              SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
              Navigator.of(context).pop();
              _refreshVideo();
            },
          ),
        ),
      );
    }
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
    PrintHelper.info("Full screen toggled. New state: $_isFullScreen");
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
      child: Container(
        color: Colors.black,
        child: _isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(_controller, key: Key(widget.videoUrl)),
              VideoControls(
                controller: _controller,
                isFullScreen: _isFullScreen,
                onToggleFullScreen: _toggleFullScreen,
              ),
            ],
          ),
        )
            : const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class FullScreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;
  final VoidCallback onExitFullScreen;

  const FullScreenVideoPlayer({
    super.key,
    required this.controller,
    required this.onExitFullScreen,
  });

  @override
  State<FullScreenVideoPlayer> createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  @override
  void initState() {
    super.initState();
    PrintHelper.info("Entering full screen video player.");
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    PrintHelper.info("Exiting full screen video player.");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: widget.controller.value.aspectRatio,
              child: VideoPlayer(widget.controller, key: const Key("full_screen")),
            ),
          ),
          VideoControls(
            controller: widget.controller,
            isFullScreen: true,
            onToggleFullScreen: widget.onExitFullScreen,
          ),
        ],
      ),
    );
  }
}

class VideoControls extends StatefulWidget {
  final VideoPlayerController controller;
  final bool isFullScreen;
  final VoidCallback onToggleFullScreen;

  const VideoControls({
    super.key,
    required this.controller,
    required this.isFullScreen,
    required this.onToggleFullScreen,
  });

  @override
  State<VideoControls> createState() => _VideoControlsState();
}

class _VideoControlsState extends State<VideoControls> {
  bool _showControls = true;
  double _volume = 1.0;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    PrintHelper.info("Initializing video controls. Full screen: ${widget.isFullScreen}");
    widget.controller.addListener(_videoListener);
    widget.controller.setVolume(_volume);
    _startHideTimer();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    PrintHelper.info("Disposing video controls.");
    widget.controller.removeListener(_videoListener);
    super.dispose();
  }

  void _videoListener() {
    if (mounted) {
      PrintHelper.info("Video listener update. Position: ${widget.controller.value.position}, Playing: ${widget.controller.value.isPlaying}");
      setState(() {});
    }
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showControls = false;
          PrintHelper.info("Controls hidden by timer.");
        });
      }
    });
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
    PrintHelper.info("Controls toggled. Show controls: $_showControls");
    if (_showControls) {
      _startHideTimer();
    }
  }

  void _togglePlayPause() {
    setState(() {
      if (widget.controller.value.isPlaying) {
        PrintHelper.info("Pausing video.");
        widget.controller.pause();
      } else {
        PrintHelper.info("Playing video.");
        widget.controller.play();
      }
    });
  }

  void _seekForward() {
    PrintHelper.info("Seeking forward 10 seconds.");
    final duration = widget.controller.value.duration;
    final currentPosition = widget.controller.value.position;
    final newPosition = currentPosition + const Duration(seconds: 10);

    if (newPosition < duration) {
      widget.controller.seekTo(newPosition);
    } else {
      widget.controller.seekTo(duration);
    }
    PrintHelper.info("Seek forward complete. New position: ${widget.controller.value.position}");
  }

  void _seekBackward() {
    PrintHelper.info("Seeking backward 10 seconds.");
    final currentPosition = widget.controller.value.position;
    final newPosition = currentPosition - const Duration(seconds: 10);

    if (newPosition > Duration.zero) {
      widget.controller.seekTo(newPosition);
    } else {
      widget.controller.seekTo(Duration.zero);
    }
    PrintHelper.info("Seek backward complete. New position: ${widget.controller.value.position}");
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return duration.inHours > 0 ? "$hours:$minutes:$seconds" : "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final duration = widget.controller.value.duration;
    final position = widget.controller.value.position;

    return GestureDetector(
      onTap: _toggleControls,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.3),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                  stops: const [0.0, 0.2, 0.8, 1.0],
                ),
              ),
            ),
            if (_showControls)
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.replay_10,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      onPressed: _seekBackward,
                    ),
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      onPressed: _togglePlayPause,
                    ),
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.forward_10,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      onPressed: _seekForward,
                    ),
                  ],
                ),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            _formatDuration(position),
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: VideoProgressIndicator(
                                widget.controller,
                                allowScrubbing: true,
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                colors: const VideoProgressColors(
                                  playedColor: Colors.white,
                                  bufferedColor: Colors.white24,
                                  backgroundColor: Colors.white12,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            _formatDuration(duration),
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                onPressed: _togglePlayPause,
                              ),
                              IconButton(
                                icon: Icon(
                                  _volume > 0 ? Icons.volume_up : Icons.volume_off,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _volume = _volume > 0 ? 0.0 : 1.0;
                                    PrintHelper.info("Toggling volume. New volume: $_volume");
                                    widget.controller.setVolume(_volume);
                                  });
                                },
                              ),
                              SizedBox(
                                width: 100,
                                child: Slider(
                                  value: _volume,
                                  min: 0,
                                  max: 1,
                                  activeColor: Colors.white,
                                  inactiveColor: Colors.white24,
                                  onChanged: (value) {
                                    setState(() {
                                      _volume = value;
                                      widget.controller.setVolume(value);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              widget.isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                              color: Colors.white,
                            ),
                            onPressed: widget.onToggleFullScreen,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}