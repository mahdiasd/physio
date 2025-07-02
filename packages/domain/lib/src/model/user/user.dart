import 'package:domain/domain.dart';

class User {
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.role,
    this.status,
  });

  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String username;
  final UserRole role;
  final String? status;
}
