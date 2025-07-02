import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  RegisterResponse({
     this.id,
     this.email,
     this.firstName,
     this.lastName,
     this.username,
     this.role,
     this.status,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? role;
  final String? status;
}
