import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:splash/src/bloc/splash_event.dart';
import 'package:splash/src/bloc/splash_state.dart';
import 'package:utils/utils.dart';

import 'package:url_launcher/url_launcher.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetConfigUseCase _configUseCase;

  SplashBloc(this._configUseCase) : super(SplashState()) {
    on<OnRefresh>(_getConfig);
    on<OnUpdateClick>(_openStore);
  }

  Future<void> _getConfig(OnRefresh event, Emitter<SplashState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _configUseCase.getConfig();
    emit(state.copyWith(isLoading: false));

    switch (result) {
      case Ok<Config>():
        emit(state.copyWith(config: result.value));
        final updateState = await getUpdateState(result.value);
        emit(state.copyWith(updateState: updateState));
        break;
      case Error<Config>():
        // TODO implement error handler.
        break;
    }
  }

  Future<void> _openStore(OnUpdateClick event, Emitter<SplashState> emit) async {
    if (state.config != null) {
      final url = AppInfo().getDeviceType() == DeviceOsType.Android
          ? state.config!.update.googlePlayUrl
          : state.config!.update.appStorePlayUrl;

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        // TODO: Handle the case where the URL can't be launched.
      }
    }
  }
  Future<UpdateState> getUpdateState(Config value) async {
    final appVersion = await AppInfo().getAppVersion();
    return value.update.getState(int.parse(appVersion));
  }
}
