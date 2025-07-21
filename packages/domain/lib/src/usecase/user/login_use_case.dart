import 'package:domain/src/repository/user/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@injectable
class LoginUseCase {
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository);

  Future<Result<Map<String, dynamic>>> invoke(String email, String password) {
    final result = _userRepository.login(email: email, password: password);
    PrintHelper.info(result.toString() , location: "LoginUseCase");
    return result;
  }
}
