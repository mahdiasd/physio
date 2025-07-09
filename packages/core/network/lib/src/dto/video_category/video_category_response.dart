import 'package:json_annotation/json_annotation.dart';

part 'video_category_response.g.dart';

@JsonSerializable()
class VideoCategoryResponse {
  VideoCategoryResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.colorCode,
    required this.isActive,
  });

  factory VideoCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCategoryResponseToJson(this);

  final String id;
  final String name;
  final String description;
  final String colorCode;
  final bool isActive;
}
