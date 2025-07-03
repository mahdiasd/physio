import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReadAccessTokenUseCase {
  final StorageRepository _storageRepository;

  ReadAccessTokenUseCase(this._storageRepository);

  Future<String?> invoke() async {
    return await _storageRepository.readAccessToken();
  }
}
