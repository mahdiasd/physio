//@GeneratedMicroModule;DomainPackageModule;package:domain/src/di/domain_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:domain/src/repository/user/user_repository.dart' as _i498;
import 'package:domain/src/usecase/config/get_config_use_case.dart' as _i927;
import 'package:domain/src/usecase/user/login_use_case.dart' as _i203;
import 'package:domain/src/usecase/user/register_use_case.dart' as _i531;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i927.GetConfigUseCase>(
        () => _i927.GetConfigUseCase(gh<_i494.ConfigRepository>()));
    gh.factory<_i203.LoginUseCase>(
        () => _i203.LoginUseCase(gh<_i498.UserRepository>()));
    gh.factory<_i531.RegisterUseCase>(
        () => _i531.RegisterUseCase(gh<_i498.UserRepository>()));
  }
}
