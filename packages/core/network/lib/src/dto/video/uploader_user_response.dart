import 'package:json_annotation/json_annotation.dart';

part 'uploader_user_response.g.dart';


@JsonSerializable()
class UploaderUserResponse {
  final String firstName;

  final String lastName;

  UploaderUserResponse({
    required this.firstName,
    required this.lastName,
  });

  factory UploaderUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UploaderUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploaderUserResponseToJson(this);
}