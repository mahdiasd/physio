import 'package:domain/src/repository/user/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@injectable
class ValidateEmailUseCase {
  final UserRepository _userRepository;

  ValidateEmailUseCase(this._userRepository);

  Future<Result<String>> invoke(String email) {
    return _userRepository.validateEmail(email: email);
  }
}
