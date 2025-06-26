import 'package:domain/src/repository/user/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@injectable
class SendOtpCodeUseCase {
  final UserRepository _userRepository;

  SendOtpCodeUseCase(this._userRepository);

  Future<Result<String>> sendCodes(String code) {
    return _userRepository.sendOtpCodes(code: code);
  }
}
