import 'package:domain/src/model/user.dart';
import 'package:utils/utils.dart';

abstract class UserRepository {
  Future<Result<User>> login(String username, String password);
}
