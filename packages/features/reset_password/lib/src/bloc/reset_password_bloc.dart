import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';
import 'package:utils/src/model/result.dart';

import 'reset_password_effect.dart';
import 'reset_password_event.dart';
import 'reset_password_state.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState>
    with SideEffectMixin<ResetPasswordState, ResetPasswordEffect> {

  final SendOtpCodeUseCase _sendOtpCodeUseCase;

  ResetPasswordBloc(this._sendOtpCodeUseCase) : super(ResetPasswordState()) {
    on<CodeChanged>((event, emit) {
      emit(state.copyWith(code: event.code));
    });

    on<InitEmail>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<RepeatPasswordChanged>((event, emit) {
      emit(state.copyWith(repeatPassword: event.repeatPassword));
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
    });

    on<ToggleRepeatPasswordVisibility>((event, emit) {
      emit(state.copyWith(
          isRepeatPasswordObscured: !state.isRepeatPasswordObscured));
    });

    on<ResetPasswordClick>(_onResetPassword);

    on<ResendCodeClicked>(_resend);
  }

  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    final isValidCode =
        state.code.length == 4 && RegExp(r'^\d$').hasMatch(state.code);

    if (!isValidCode) {
      emitMessage(UiMessage(
          message: "Please enter all 4 digits of the code correctly."));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final result = await _sendOtpCodeUseCase.sendCodes(state.code);

    emit(state.copyWith(isLoading: false,));

    switch (result) {
      case Ok<String>():
        emitEffect(NavigateToMain());
        break;
      case Error<String>():
        emitMessage(result.error.toUiMessage());
        break;
    }
  }

  Future<void> _resend(
    ResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(state.copyWith(isResendLoading: true));
    final result = await _sendOtpCodeUseCase.sendCodes(state.code);
    emit(state.copyWith(isResendLoading: false));
    switch (result) {
      case Ok<String>():
        break;
      case Error<String>():
        emitMessage(result.error.toUiMessage());
        break;
    }
  }
}
