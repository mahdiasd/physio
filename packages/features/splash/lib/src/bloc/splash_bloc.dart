import 'dart:core';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:splash/src/bloc/splash_effect.dart';
import 'package:splash/src/bloc/splash_event.dart';
import 'package:splash/src/bloc/splash_state.dart';
import 'package:ui/ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utils/utils.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> with SideEffectMixin<SplashState, SplashEffect> {
  final GetConfigUseCase _configUseCase;
  final ReadAccessTokenUseCase _readAccessTokenUseCase;

  String? _accessToken = null;

  SplashBloc(this._configUseCase, this._readAccessTokenUseCase) : super(SplashState()) {
    on<OnRefresh>(_getConfig);
    on<OnUpdateClick>(_openStore);
    add(OnRefresh());

    readAccessToken();
  }

  void readAccessToken() async {
    _accessToken = await _readAccessTokenUseCase.invoke();
    PrintHelper.info("accessToken: $_accessToken");
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
        if (updateState == UpdateState.upToDate) {
          if (_accessToken != null && _accessToken?.length != 0)
            emitEffect(NavigateToMain());
          else
            emitEffect(NavigateToLogin());
        }
        break;
      case Error():
        emitMessage(result.error.toUiMessage());
        result.error.dLog(plusKey: "inside get config");
    }
  }

  Future<void> _openStore(OnUpdateClick event, Emitter<SplashState> emit) async {
    if (state.config != null) {
      final url = AppInfo().getDeviceType() == DeviceOsType.Android ? state.config!.update.googlePlayUrl : state.config!.update.appStorePlayUrl;

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
