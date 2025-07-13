// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/src/di/data_di.module.dart' as _i24;
import 'package:domain/src/di/domain_di.module.dart' as _i887;
import 'package:forgot/src/di/forgot_di.module.dart' as _i813;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:login/src/di/login_di.module.dart' as _i63;
import 'package:main/src/di/main_di.module.dart' as _i231;
import 'package:network/src/di/network_di.module.dart' as _i292;
import 'package:register/src/di/register_di.module.dart' as _i536;
import 'package:reset_password/src/di/reset_password_di.module.dart' as _i1021;
import 'package:search/src/di/search_di.module.dart' as _i1029;
import 'package:splash/src/di/splash_di.module.dart' as _i49;
import 'package:storage/src/di/storage_di.module.dart' as _i314;
import 'package:verify/src/di/verify_di.module.dart' as _i262;
import 'package:video_detail/src/di/video_detail_di.module.dart' as _i75;
import 'package:video_library/src/di/video_library_di.module.dart' as _i255;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i292.NetworkPackageModule().init(gh);
    await _i314.StoragePackageModule().init(gh);
    await _i24.DataPackageModule().init(gh);
    await _i887.DomainPackageModule().init(gh);
    await _i813.ForgotPackageModule().init(gh);
    await _i63.LoginPackageModule().init(gh);
    await _i231.MainPackageModule().init(gh);
    await _i536.RegisterPackageModule().init(gh);
    await _i1021.ResetPasswordPackageModule().init(gh);
    await _i1029.SearchPackageModule().init(gh);
    await _i49.SplashPackageModule().init(gh);
    await _i262.VerifyPackageModule().init(gh);
    await _i75.VideoDetailPackageModule().init(gh);
    await _i255.VideoLibraryPackageModule().init(gh);
    return this;
  }
}
