import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storage/src/service/storage_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StorageService)
class StorageServiceImpl extends StorageService {
  final FlutterSecureStorage _storage;

  @override
  StorageServiceImpl(this._storage);

  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
