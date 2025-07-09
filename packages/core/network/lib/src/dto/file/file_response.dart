import 'package:json_annotation/json_annotation.dart';

part 'file_response.g.dart';

@JsonSerializable()
class FileResponse {
  FileResponse({
    required this.id,
    required this.originalFilename,
    required this.storedFilename,
    required this.storagePath,
    required this.contentType,
    required this.fileCategory,
    required this.status,
    required this.isPublic,
  });

  factory FileResponse.fromJson(Map<String, dynamic> json) =>
      _$FileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FileResponseToJson(this);

  final String id;
  final String originalFilename;
  final String storedFilename;
  final String storagePath;
  final String contentType;
  final String fileCategory;
  final String status;
  final bool isPublic;
}
