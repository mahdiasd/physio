import 'package:json_annotation/json_annotation.dart';

part 'video_category.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoCategory {
  VideoCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.colorCode,
    required this.isActive,
  });

  final String id;
  final String name;
  final String description;
  final String colorCode;
  final bool isActive;

  factory VideoCategory.fromJson(Map<String, dynamic> json) =>
      _$VideoCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCategoryToJson(this);

}
