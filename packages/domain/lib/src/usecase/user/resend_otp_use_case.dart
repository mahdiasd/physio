import 'package:domain/src/repository/user/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@injectable
class ResendOTPUseCase {
  final UserRepository _userRepository;

  ResendOTPUseCase(this._userRepository);

  Future<Result<bool>> resendFromForgot(String email) {
    return _userRepository.resendOTP(email: email, type: "forgot");
  }

  Future<Result<bool>> resendFromVerify(String email) {
    return _userRepository.resendOTP(email: email, type: "verify");
  }
}
