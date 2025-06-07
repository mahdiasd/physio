import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/src/bloc/login_event.dart';
import 'package:login/src/bloc/login_state.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/src/model/result.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginState()) {

    on<UsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>(_onLoginSubmitted);

  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _loginUseCase.login(state.username, state.password);
    emit(state.copyWith(isLoading: false));

    switch (result) {
      case Ok<User>():
        emit(state.copyWith(user: result.value));
      case Error<User>():
        break;
    }
  }
}
