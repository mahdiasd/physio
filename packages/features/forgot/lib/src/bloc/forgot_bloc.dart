import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';
import 'package:utils/src/model/result.dart';

import 'forgot_effect.dart';
import 'forgot_event.dart';
import 'forgot_state.dart';


@injectable
class ForgotBloc extends Bloc<ForgotEvent, ForgotState>
    with SideEffectMixin<ForgotState, ForgotEffect> {
  final ValidateEmailUseCase _validateEmailUseCase;

  ForgotBloc(this._validateEmailUseCase) : super(ForgotState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<ForgotPressed>(_onForgotSubmitted);
  }

  Future<void> _onForgotSubmitted(ForgotPressed event, Emitter<ForgotState> emit,) async {
    emit(state.copyWith(isLoading: true));
    final result = await _validateEmailUseCase.validateEmail(state.email);
    emit(state.copyWith(isLoading: false));

    switch (result) {
      case Ok<String>():
        emitEffect(NavigateToVerify());
        print("***************************************************** Ok<User>()");
        break;
      case Error<String>():
        print("***************************************************** Error<User>()");
        emitMessage(result.error.toUiMessage());
        break;
    }
  }
}
