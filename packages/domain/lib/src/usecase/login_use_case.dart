import 'package:domain/src/model/user.dart';
import 'package:domain/src/repository/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@Injectable()
class LoginUseCase {
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository);

  Future<Result<User>> login(String username, String password) {
    return _userRepository.login(username, password);
  }
}
