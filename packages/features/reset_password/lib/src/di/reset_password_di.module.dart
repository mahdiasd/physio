//@GeneratedMicroModule;ResetPasswordPackageModule;package:reset_password/src/di/reset_password_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:reset_password/src/bloc/reset_password_bloc.dart' as _i654;

class ResetPasswordPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i654.ResetPasswordBloc>(
        () => _i654.ResetPasswordBloc(gh<_i494.SendOtpCodeUseCase>()));
  }
}
