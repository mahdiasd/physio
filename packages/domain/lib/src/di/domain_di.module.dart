//@GeneratedMicroModule;DomainPackageModule;package:domain/src/di/domain_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:domain/src/repository/user/user_repository.dart' as _i498;
import 'package:domain/src/usecase/config/get_config_use_case.dart' as _i927;
import 'package:domain/src/usecase/library/get_library_use_case.dart' as _i242;
import 'package:domain/src/usecase/storage/read_access_token_use_case.dart'
    as _i553;
import 'package:domain/src/usecase/user/login_use_case.dart' as _i203;
import 'package:domain/src/usecase/user/register_use_case.dart' as _i531;
import 'package:domain/src/usecase/user/resend_otp_use_case.dart' as _i796;
import 'package:domain/src/usecase/user/reset_password_use_case.dart' as _i491;
import 'package:domain/src/usecase/user/send_otp_codes_use_case.dart' as _i979;
import 'package:domain/src/usecase/user/validate_email_use_case.dart' as _i706;
import 'package:domain/src/usecase/video/flag_video_use_case.dart' as _i139;
import 'package:domain/src/usecase/video/get_video_use_case.dart' as _i256;
import 'package:domain/src/usecase/video/get_videos_use_case.dart' as _i691;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i927.GetConfigUseCase>(
        () => _i927.GetConfigUseCase(gh<_i494.ConfigRepository>()));
    gh.factory<_i139.FlagVideoUseCase>(
        () => _i139.FlagVideoUseCase(gh<_i494.VideoRepository>()));
    gh.factory<_i691.GetVideosUseCase>(
        () => _i691.GetVideosUseCase(gh<_i494.VideoRepository>()));
    gh.factory<_i256.GetVideoUseCase>(
        () => _i256.GetVideoUseCase(gh<_i494.VideoRepository>()));
    gh.factory<_i203.LoginUseCase>(
        () => _i203.LoginUseCase(gh<_i498.UserRepository>()));
    gh.factory<_i531.RegisterUseCase>(
        () => _i531.RegisterUseCase(gh<_i498.UserRepository>()));
    gh.factory<_i796.ResendOTPUseCase>(
        () => _i796.ResendOTPUseCase(gh<_i498.UserRepository>()));
    gh.factory<_i491.ResetPasswordUseCase>(
        () => _i491.ResetPasswordUseCase(gh<_i498.UserRepository>()));
    gh.factory<_i979.VerifyEmailUseCase>(
        () => _i979.VerifyEmailUseCase(gh<_i498.UserRepository>()));
    gh.factory<_i706.ValidateEmailUseCase>(
        () => _i706.ValidateEmailUseCase(gh<_i498.UserRepository>()));
    gh.factory<_i242.GetLibraryUseCase>(
        () => _i242.GetLibraryUseCase(gh<_i494.VideoLibraryRepository>()));
    gh.factory<_i553.ReadAccessTokenUseCase>(
        () => _i553.ReadAccessTokenUseCase(gh<_i494.StorageRepository>()));
  }
}
