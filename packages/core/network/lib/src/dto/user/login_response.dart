import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/dto/user/user_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    required this.user,
    this.isFirstLogin = false,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  final UserResponse user;

  final bool isFirstLogin;

  final String accessToken;

  final String refreshToken;
}
