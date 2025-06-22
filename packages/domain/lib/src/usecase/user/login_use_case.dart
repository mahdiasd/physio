import 'package:domain/src/model/user.dart';
import 'package:domain/src/repository/user/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@injectable
class LoginUseCase {
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository);

  Future<Result<User>> login(String email, String password) {
    return _userRepository.login(email: email, password: password);
  }
}
