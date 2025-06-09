import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@Injectable()
class GetConfigUseCase {
  final ConfigRepository _configRepository;

  GetConfigUseCase(this._configRepository);

  Future<Result<Config>> getConfig() {
    return _configRepository.getConfig();
  }
}
