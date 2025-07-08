import '../../../domain.dart';

class Video {
  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.thumbnail,
    required this.durationSeconds,
    required this.category,
    required this.visibility,
    required this.status,
    required this.viewCount,
    required this.createdAt,
  });

  final String id;
  final String title;
  final String description;
  final String url;
  final String thumbnail;
  final int durationSeconds;
  final VideoCategory category;
  final VideoVisibility visibility;
  final VideoStatus status;
  final int viewCount;
  final DateTime createdAt;
}
