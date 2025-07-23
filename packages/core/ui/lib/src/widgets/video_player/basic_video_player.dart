import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';

class BasicVideoPlayer extends StatelessWidget {
  final VideoController controller; // ورودی اصلی، کنترلر است
  final double? height;
  final double? width;

  const BasicVideoPlayer({
    super.key,
    required this.controller,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      // استفاده از ویجت Video با کنترلر دریافت شده
      child: Video(
        controller: controller,
        // برای داشتن کنترل‌های پخش (play, pause, seek, fullscreen)
        controls: MaterialVideoControls,
      ),
    );
  }
}