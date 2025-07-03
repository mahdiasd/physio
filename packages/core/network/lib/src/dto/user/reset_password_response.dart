import 'package:json_annotation/json_annotation.dart';
import 'package:network/network.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  ResetPasswordResponse({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);

  final UserResponse user;
  final String accessToken;
  final String refreshToken;
}
