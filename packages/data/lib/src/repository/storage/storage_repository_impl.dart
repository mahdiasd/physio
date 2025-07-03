import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:storage/storage.dart';

@LazySingleton(as: StorageRepository)
class StorageRepositoryImpl extends StorageRepository {
  final StorageService _storageService;

  StorageRepositoryImpl(this._storageService);

  @override
  Future<void> deleteAll() {
    return _storageService.deleteAll();
  }

  @override
  Future<Map<String, String>> readAll() {
    return _storageService.readAll();
  }

  @override
  Future<void> write({required String key, required String value}) {
    return _storageService.write(key: key, value: value);
  }

  @override
  Future<String?> readAccessToken() {
    return _storageService.read(key: StorageKeys.accessToken);
  }

  @override
  Future<String?> readRefreshToken() {
    return _storageService.read(key: StorageKeys.refreshToken);
  }
}
