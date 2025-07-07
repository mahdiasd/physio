import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:login/src/bloc/login_event.dart';
import 'package:login/src/bloc/login_state.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import 'login_effect.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> with SideEffectMixin<LoginState, LoginEffect> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
    });

    on<ResetPasswordPressed>((event, emit) {
      emit(state.copyWith(isShowResetPassDialog: false));
      emitEffect(NavigateToResetPassword());
    });

    on<ForgotPasswordPressed>((event, emit) {
      emitEffect(NavigateToForgotPassword());
    });

    on<RegisterPressed>((event, emit) {
      print("RegisterPressed");
      emitEffect(NavigateToRegister());
    });

    on<LoginPressed>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _loginUseCase.invoke(state.email, state.password);
    emit(state.copyWith(isLoading: false));

    switch (result) {
      case Ok<Map<String, dynamic>>():
        if (result.value["isFirstLogin"] == true) {
          emit(state.copyWith(isShowResetPassDialog: true));
        } else {
          emitEffect(NavigateToMain());
        }
        break;
      case Error<Map<String, dynamic>>():
        final errorCode = (result.error.code ?? 0);
        if (errorCode > 209 && errorCode < 310) {
          await Future<void>.delayed(Duration(seconds: 5));
          emitMessage(result.error.toUiMessage());
          emitEffect(NavigateToVerify());
        } else {
          PrintHelper.error(result.error.message);
          emitMessage(result.error.toUiMessage());
        }
        break;
    }
  }
}
