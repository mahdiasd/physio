//@GeneratedMicroModule;StoragePackageModule;package:storage/src/di/storage_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:injectable/injectable.dart' as _i526;
import 'package:storage/src/di/storage_module.dart' as _i364;
import 'package:storage/src/service/storage_service.dart' as _i592;
import 'package:storage/src/service/storage_service_impl.dart' as _i563;

class StoragePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final storageModule = _$StorageModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => storageModule.secureStorageService());
    gh.lazySingleton<_i592.StorageService>(
        () => _i563.StorageServiceImpl(gh<_i558.FlutterSecureStorage>()));
  }
}

class _$StorageModule extends _i364.StorageModule {}
