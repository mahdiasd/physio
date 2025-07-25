//@GeneratedMicroModule;DataPackageModule;package:data/src/di/data_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data/src/di/mapper_module.dart' as _i882;
import 'package:data/src/mapper/mapper.dart' as _i453;
import 'package:data/src/repository/config/config_repository_impl.dart'
    as _i194;
import 'package:data/src/repository/storage/storage_repository_impl.dart'
    as _i643;
import 'package:data/src/repository/user/user_repository_impl.dart' as _i931;
import 'package:data/src/repository/video/video_repository_impl.dart' as _i68;
import 'package:data/src/repository/video_library/video_library_repository_impl.dart'
    as _i259;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network/network.dart' as _i372;
import 'package:storage/storage.dart' as _i431;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final appModule = _$AppModule();
    gh.lazySingleton<_i453.Mappr>(() => appModule.mappr);
    gh.lazySingleton<_i494.UserRepository>(() => _i931.UserRepositoryImpl(
          gh<_i372.UserApiService>(),
          gh<_i431.StorageService>(),
          gh<_i453.Mappr>(),
        ));
    gh.lazySingleton<_i494.ConfigRepository>(() => _i194.ConfigRepositoryImpl(
          gh<_i372.ConfigApiService>(),
          gh<_i453.Mappr>(),
        ));
    gh.lazySingleton<_i494.VideoLibraryRepository>(
        () => _i259.VideoLibraryRepositoryImpl(
              gh<_i372.VideoLibraryApiService>(),
              gh<_i453.Mappr>(),
            ));
    gh.lazySingleton<_i494.StorageRepository>(
        () => _i643.StorageRepositoryImpl(gh<_i431.StorageService>()));
    gh.lazySingleton<_i494.VideoRepository>(() => _i68.VideoRepositoryImpl(
          gh<_i372.VideoApiService>(),
          gh<_i453.Mappr>(),
        ));
  }
}

class _$AppModule extends _i882.AppModule {}
