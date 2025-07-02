import 'package:domain/src/repository/user/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@injectable
class VerifyEmailUseCase {
  final UserRepository _userRepository;

  VerifyEmailUseCase(this._userRepository);

  Future<Result<bool>> invoke(String code, String email) {
    return _userRepository.verifyEmail(code: code, email:  email);
  }
}
