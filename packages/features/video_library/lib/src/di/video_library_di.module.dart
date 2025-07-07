//@GeneratedMicroModule;VideoLibraryPackageModule;package:video_library/src/di/video_library_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:video_library/src/bloc/video_library_bloc.dart' as _i864;

class VideoLibraryPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i864.VideoLibraryBloc>(
        () => _i864.VideoLibraryBloc(gh<_i494.ResendOTPUseCase>()));
  }
}
