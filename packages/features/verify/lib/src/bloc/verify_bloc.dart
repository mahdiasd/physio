import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';
import 'package:utils/src/model/result.dart';

import 'verify_effect.dart';
import 'verify_event.dart';
import 'verify_state.dart';

@injectable
class VerifyBloc extends Bloc<VerifyEvent, VerifyState> with SideEffectMixin<VerifyState, VerifyEffect> {
  final VerifyEmailUseCase _verifyEmailUseCase;
  final ResendOTPUseCase _resendOTPUseCase;

  VerifyBloc(this._verifyEmailUseCase, this._resendOTPUseCase) : super(VerifyState()) {
    on<CodeChange>((event, emit) {
      emit(state.copyWith(code: event.value));
    });

    on<InitEmail>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<VerifyClick>(_onVerify);

    on<ContinueClick>((event, emit) {
      emitEffect(NavigateToMain());
    });

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
      emitMessage(UiMessage(message: "Please enter all 4 digits of the code correctly."));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final result = await _verifyEmailUseCase.invoke(state.code, state.email);

    switch (result) {
      case Ok<bool>():
        emit(state.copyWith(isVerified: true, isLoading: false));
        break;
      case Error<bool>():
        emit(state.copyWith(isLoading: false));
        emitMessage(result.error.toUiMessage());
        break;
    }
  }

  Future<void> _resend(
    VerifyEvent event,
    Emitter<VerifyState> emit,
  ) async {
    emit(state.copyWith(isResendLoading: true));

    final result = await _resendOTPUseCase.resendFromVerify(state.email);

    emit(state.copyWith(isResendLoading: false));

    switch (result) {
      case Ok<bool>():
        emitMessage(UiMessage(message: "OTP has been resent to your email.", status: UiMessageStatus.Success));
        break;
      case Error<bool>():
        emitMessage(result.error.toUiMessage());
        break;
    }
  }
}
