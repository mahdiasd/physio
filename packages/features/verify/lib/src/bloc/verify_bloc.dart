import 'package:domain/domain.dart';
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
    on<CodeDigitChanged>((event, emit) {
      final updated = List<String>.from(state.codes);
      updated[event.index] = event.value;
      emit(state.copyWith(codeDigits: updated));
    });

    on<VerifyClick>(_onVerify);
  }

  Future<void> _onVerify(
    VerifyEvent event,
    Emitter<VerifyState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _sendOtpCodeUseCase.sendCodes(state.codes);
    emit(state.copyWith(isLoading: false));
    switch (result) {
      case Ok<String>():
        emit(state.copyWith(isVerified: true));
        break;
      case Error<String>():
        emitMessage(result.error.toUiMessage());
        break;
    }
  }
}
