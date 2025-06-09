import 'package:json_annotation/json_annotation.dart';

part 'update_response.g.dart';

@JsonSerializable()
class UpdateResponse {

  @JsonKey(name: 'force_version', defaultValue: 0)
  final int forceVersion;

  @JsonKey(name: 'last_version', defaultValue: 0)
  final int lastVersion;

  @JsonKey(name: 'suggest_version', defaultValue: 0)
  final int suggestVersion;

  @JsonKey(defaultValue: '')
  final String link;

  @JsonKey(defaultValue: '')
  final String message;

  UpdateResponse({
    required this.forceVersion,
    required this.lastVersion,
    required this.suggestVersion,
    required this.link,
    required this.message,
  });

  factory UpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateResponseToJson(this);
}