import 'package:domain/src/repository/user/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@injectable
class ResetPasswordUseCase {
  final UserRepository _userRepository;

  ResetPasswordUseCase(this._userRepository);

  Future<Result<bool>> invoke({
    required String email,
    required String code,
    required String password,
    required String confirmPassword,
  }) {
    return _userRepository.resetPassword(
      email: email,
      code: code,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
