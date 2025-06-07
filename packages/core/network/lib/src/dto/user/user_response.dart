import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.avatar,
    required this.mySessionCount,
    required this.totalSessions,
    required this.post,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  final String? id;
  @JsonKey(name: 'first_name')
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? avatar;
  final int? mySessionCount;
  final int? totalSessions;
  final String? post;
}
