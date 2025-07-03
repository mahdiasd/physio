abstract class StorageRepository {

  Future<void> write({required String key, required String value});

  Future<String?> readAccessToken();
  Future<String?> readRefreshToken();

  Future<Map<String, String>> readAll();

  Future<void> deleteAll();
}