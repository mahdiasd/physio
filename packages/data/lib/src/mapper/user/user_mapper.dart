import 'package:data/src/mapper/user/user_role_mapper.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';

/// Extension on UserResponse to map it to domain User model
extension UserResponseMapper on UserResponse {
  /// Converts a UserResponse to a User domain model
  User toDomain() => User(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
        username: username,
        role: role.toUserRole(),
        status: status,
      );
}

/// Extension on List<UserResponse> to map multiple responses at once
extension UserResponseListMapper on List<UserResponse> {
  /// Converts a list of UserResponse objects to a list of User domain models
  List<User> toDomain() => map((response) => response.toDomain()).toList();
}
