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
    on<CodeDigitChanged>((event, emit) {
      final updated = List<String>.from(state.codes);
      updated[event.index] = event.value;
      emit(state.copyWith(codeDigits: updated));
    });

    on<ResetPasswordClick>(_onResetPassword);

    on<ResendCodeClicked>(_resend);
  }

  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    final isValidCode = state.codes.length == 4 &&
        state.codes.every((digit) => RegExp(r'^\d$').hasMatch(digit));

    if (!isValidCode) {
      emitMessage(UiMessage(
          message: "Please enter all 4 digits of the code correctly."));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final result = await _sendOtpCodeUseCase.sendCodes(state.codes);

    emit(state.copyWith(isLoading: false, isVerified: true));

    switch (result) {
      case Ok<String>():
        emit(state.copyWith(isVerified: true));
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
    final result = await _sendOtpCodeUseCase.sendCodes(state.codes);
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
