import 'package:data/src/mapper/user/user_role_mapper.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';

extension RegisterResponseMapper on RegisterResponse {
  User toDomain() => User(
        id: this.id ?? "",
        email: this.email ?? "",
        firstName: this.firstName ?? "",
        lastName: this.lastName ?? "",
        role: this.role.toUserRole(),
        status: this.status,
      );
}
