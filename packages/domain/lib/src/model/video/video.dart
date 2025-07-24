import '../../../domain.dart';

class Video {
  String category;
  String coverPhoto;
  DateTime createdAt;
  String description;
  String id;
  bool isPublic;
  List<VideoSummary> relatedVideos;
  String status;
  List<String> tags;
  String title;
  DateTime updatedAt;
  UploaderUser uploader;
  PhysioFile videoFile;
  bool isFlagged;

  Video({
    required this.category,
    required this.coverPhoto,
    required this.createdAt,
    required this.description,
    required this.id,
    required this.isPublic,
    required this.relatedVideos,
    required this.isFlagged,
    required this.status,
    required this.tags,
    required this.title,
    required this.updatedAt,
    required this.uploader,
    required this.videoFile,
  });
}
