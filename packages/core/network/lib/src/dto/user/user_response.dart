import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.status,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final String? status;
}
