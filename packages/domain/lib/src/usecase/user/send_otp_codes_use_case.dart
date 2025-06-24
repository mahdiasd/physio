import 'package:domain/src/repository/user/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@injectable
class SendOtpCodesUseCase {
  final UserRepository _userRepository;

  SendOtpCodesUseCase(this._userRepository);

  Future<Result<String>> validateEmail(List<String> codes) {
    return _userRepository.sendOtpCodes(code: codes.join());
  }
}
