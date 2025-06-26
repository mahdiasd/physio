import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';
import 'package:utils/src/model/result.dart';

import 'verify_effect.dart';
import 'verify_event.dart';
import 'verify_state.dart';

@injectable
class VerifyBloc extends Bloc<VerifyEvent, VerifyState>
    with SideEffectMixin<VerifyState, VerifyEffect> {
  final SendOtpCodeUseCase _sendOtpCodeUseCase;

  VerifyBloc(this._sendOtpCodeUseCase) : super(VerifyState()) {
    on<CodeChange>((event, emit) {
      emit(state.copyWith(code: event.value));
    });

    on<InitEmail>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<VerifyClick>(_onVerify);

    on<ResendCodeClicked>(_resend);
  }

  void passData(String email) {
    add(InitEmail(email));
  }

  Future<void> _onVerify(
    VerifyEvent event,
    Emitter<VerifyState> emit,
  ) async {
    final isValidCode = state.code.length == 4;

    if (!isValidCode) {
      emitMessage(UiMessage(
          message: "Please enter all 4 digits of the code correctly."));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final result = await _sendOtpCodeUseCase.sendCodes(state.code);

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
    VerifyEvent event,
    Emitter<VerifyState> emit,
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
