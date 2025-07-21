//@GeneratedMicroModule;NetworkPackageModule;package:network/src/di/network_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:dio/dio.dart' as _i361;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network/network.dart' as _i372;
import 'package:network/src/api/auth/auth_api_service.dart' as _i414;
import 'package:network/src/api/auth/auth_api_service_impl.dart' as _i805;
import 'package:network/src/api/config/config_api_service.dart' as _i329;
import 'package:network/src/api/config/config_api_service_impl.dart' as _i77;
import 'package:network/src/api/library/video_library_api_service.dart'
    as _i414;
import 'package:network/src/api/library/video_library_api_service_impl.dart'
    as _i475;
import 'package:network/src/api/user/user_api_service_impl.dart' as _i208;
import 'package:network/src/api/video/video_api_service_impl.dart' as _i786;
import 'package:network/src/di/network_module.dart' as _i1026;
import 'package:network/src/utils/token_interceptor.dart' as _i1068;
import 'package:storage/storage.dart' as _i431;

class NetworkPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final networkModule = _$NetworkModule();
    gh.lazySingleton<String>(
      () => networkModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule
          .dioWithoutInterceptors(gh<String>(instanceName: 'baseUrl')),
      instanceName: 'dioWithoutInterceptors',
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(
          gh<String>(instanceName: 'baseUrl'),
          gh<_i361.Dio>(instanceName: 'dioWithoutInterceptors'),
          gh<_i431.StorageService>(),
        ));
    gh.lazySingleton<_i414.VideoLibraryApiService>(
        () => _i475.VideoLibraryApiServiceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i414.AuthApiService>(
        () => _i805.AuthApiServiceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i372.UserApiService>(
        () => _i208.UserApiServiceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i329.ConfigApiService>(
        () => _i77.ConfigApiServiceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i372.VideoApiService>(
        () => _i786.VideoApiServiceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i1068.TokenInterceptor>(() => _i1068.TokenInterceptor(
          gh<_i431.StorageService>(),
          gh<_i361.Dio>(),
          gh<_i414.AuthApiService>(),
        ));
  }
}

class _$NetworkModule extends _i1026.NetworkModule {}
