//@GeneratedMicroModule;VideoDetailPackageModule;package:video_detail/src/di/video_detail_di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:video_detail/src/bloc/video_detail_bloc.dart' as _i429;

class VideoDetailPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i429.VideoDetailBloc>(() => _i429.VideoDetailBloc(
          gh<_i494.FlagVideoUseCase>(),
          gh<_i494.GetVideoUseCase>(),
        ));
  }
}
