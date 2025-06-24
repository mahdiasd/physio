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
  final ValidateEmailUseCase _validateEmailUseCase;

  VerifyBloc(this._validateEmailUseCase) : super(VerifyState()) {

    on<CodeDigitChanged>((event, emit) {
      final updated = List<String>.from(state.codeDigits);
      updated[event.index] = event.value;
      emit(state.copyWith(codeDigits: updated));
    });


    on<VerifyClick>(_onVerify);
  }

  Future<void> _onVerify(VerifyEvent event, Emitter<VerifyState> emit,) async {
    emit(state.copyWith(isLoading: true));
    final result = await _validateEmailUseCase.validateEmail(state.email);
    emit(state.copyWith(isLoading: false));
    switch (result) {
      case Ok<String>():

        break;
      case Error<String>():
        emitMessage(result.error.toUiMessage());
        break;
    }
  }
}
