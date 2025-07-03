import 'package:domain/domain.dart';

extension UserRoleMapper on String? {
  UserRole toUserRole() {
    switch (this?.toLowerCase()) {
      case 'client':
        return UserRole.CLIENT;
      case 'practitioner':
        return UserRole.PRACTITIONER;
      case 'manager':
        return UserRole.MANAGER;
      case 'staff':
        return UserRole.STAFF;
      case 'admin':
        return UserRole.ADMIN;
      default:
        return UserRole.CLIENT;
    }
  }
}
