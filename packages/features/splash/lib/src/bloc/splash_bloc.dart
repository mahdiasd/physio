import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:splash/src/bloc/splash_event.dart';
import 'package:splash/src/bloc/splash_state.dart';
import 'package:utils/utils.dart';

@Injectable()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetConfigUseCase _configUseCase;

  SplashBloc(this._configUseCase) : super(SplashState()) {
    on<OnRefresh>(_getConfig);
  }

  Future<void> _getConfig(OnRefresh event, Emitter<SplashState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _configUseCase.getConfig();
    emit(state.copyWith(isLoading: false));

    switch (result) {
      case Ok<Config>():
        emit(state.copyWith(config: result.value));
        break;
      case Error<Config>():
        // TODO implement error handler.
        break;
    }
  }

}
