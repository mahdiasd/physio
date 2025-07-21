class PhysioFile {
  String contentType;
  String fileCategory;
  String fileSize;
  String id;
  String originalFilename;
  String s3Url;
  String storagePath;
  String storageType;
  String storedFilename;
  String uploadedBy;
  String url;

  PhysioFile({
    required this.contentType,
    required this.fileCategory,
    required this.fileSize,
    required this.id,
    required this.originalFilename,
    required this.s3Url,
    required this.storagePath,
    required this.storageType,
    required this.storedFilename,
    required this.uploadedBy,
    required this.url,
  });

}
