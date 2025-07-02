import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/dto/user/user_response.dart';

part 'verify_email_response.g.dart';

@JsonSerializable()
class VerifyEmailResponse {
  VerifyEmailResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyEmailResponseToJson(this);


  final String accessToken;
  final String refreshToken;
}
