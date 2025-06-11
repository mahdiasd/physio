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
  final String message;

  @JsonKey(defaultValue: 'google_play_url')
  final String googlePlayUrl;

  @JsonKey(defaultValue: 'app_store_url')
  final String appStorePlayUrl;

  UpdateResponse({
    required this.forceVersion,
    required this.lastVersion,
    required this.suggestVersion,
    required this.message,
    required this.googlePlayUrl,
    required this.appStorePlayUrl,

  });

  factory UpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateResponseToJson(this);
}