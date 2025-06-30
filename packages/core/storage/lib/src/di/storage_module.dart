import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class StorageModule {
  @lazySingleton
  FlutterSecureStorage secureStorageService() {
    return FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
      webOptions: _getWebOptions(),
      lOptions: _getLinuxOptions(),
      mOptions: _getMacOsOptions(),
      wOptions: _getWindowsOptions(),
    );
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  IOSOptions _getIOSOptions() => const IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );

  WebOptions _getWebOptions() => const WebOptions(
    dbName: 'flutter_secure_storage',
  );

  LinuxOptions _getLinuxOptions() => const LinuxOptions();

  MacOsOptions _getMacOsOptions() => const MacOsOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );

  WindowsOptions _getWindowsOptions() => const WindowsOptions();

}
