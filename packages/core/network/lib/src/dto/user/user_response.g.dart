// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      mySessionCount: (json['mySessionCount'] as num?)?.toInt(),
      totalSessions: (json['totalSessions'] as num?)?.toInt(),
      post: json['post'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'avatar': instance.avatar,
      'mySessionCount': instance.mySessionCount,
      'totalSessions': instance.totalSessions,
      'post': instance.post,
    };
