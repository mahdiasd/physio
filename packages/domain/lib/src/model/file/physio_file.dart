class PhysioFile {
  PhysioFile({
    required this.id,
    required this.originalFilename,
    required this.storedFilename,
    required this.storagePath,
    required this.contentType,
    required this.fileCategory,
    required this.status,
    required this.isPublic,
  });

  final String id;
  final String originalFilename;
  final String storedFilename;
  final String storagePath;
  final String contentType;
  final String fileCategory;
  final String status;
  final bool isPublic;
}
