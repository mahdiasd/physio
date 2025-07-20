import 'package:json_annotation/json_annotation.dart';
import 'package:network/network.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable()
class RefreshTokenResponse {
  String accessToken;
  String refreshToken;
  UserResponse user;

  RefreshTokenResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}
