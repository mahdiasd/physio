import 'package:domain/src/model/user/user.dart';
import 'package:domain/src/repository/user/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@injectable
class RegisterUseCase {
  final UserRepository _userRepository;

  RegisterUseCase(this._userRepository);

  Future<Result<User>> register(
      String firstName, String lastName, String email, String password) {
    return _userRepository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
  }
}
