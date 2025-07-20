import 'package:domain/src/model/video/uploader_user.dart';

class VideoSummary {
  VideoSummary({
    required this.id,
    required this.title,
    required this.description,
    required this.coverPhoto,
    required this.viewCount,
    required this.category,
    required this.uploader,
  });

  final String id;
  final String title;
  final String description;
  final String coverPhoto;
  final String category;
  final int viewCount;
  final UploaderUser uploader;
}