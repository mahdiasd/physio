import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  ErrorResponse({
    required this.message,
    required this.error,
    required this.statusCode,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  @JsonKey(fromJson: _parseMessage)
  final String message;

  final String error;
  final int statusCode;

  static String _parseMessage(dynamic json) {
    if (json == null) return '';

    if (json is String) {
      return json;
    } else if (json is List) {
      return json.whereType<String>().join('\n');
    } else {
      return json.toString();
    }
  }
}
