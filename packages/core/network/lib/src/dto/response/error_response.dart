import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/dto/response/paging_meta_response.dart';

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

  final String message;
  final String error;
  final int statusCode;
}