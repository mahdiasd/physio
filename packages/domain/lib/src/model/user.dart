class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.avatar,
    required this.mySessionCount,
    required this.totalSessions,
    required this.post,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? avatar;
  final int? mySessionCount;
  final int? totalSessions;
  final String? post;
}
