import '../../../domain.dart';

class Video {
  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.file,
    required this.thumbnailFile,
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
  final PhysioFile file;
  final PhysioFile thumbnailFile;
  final int durationSeconds;
  final VideoCategory category;
  final VideoVisibility visibility;
  final VideoStatus status;
  final int viewCount;
  final DateTime createdAt;
}
