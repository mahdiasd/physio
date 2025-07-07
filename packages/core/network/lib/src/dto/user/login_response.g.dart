// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      isFirstLogin: json['isFirstLogin'] as bool? ?? false,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'isFirstLogin': instance.isFirstLogin,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
