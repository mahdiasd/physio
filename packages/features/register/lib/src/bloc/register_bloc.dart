import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:register/src/bloc/register_event.dart';
import 'package:register/src/bloc/register_state.dart';
import 'package:ui/ui.dart';
import 'package:utils/src/model/result.dart';

import 'register_effect.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState>
    with SideEffectMixin<RegisterState, RegisterEffect> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc(this._registerUseCase) : super(RegisterState()) {
    print("***************************************************** RegisterBloc");

    on<FirstNameChanged>((event, emit) {
      emit(state.copyWith(firstName: event.firstName));
    });

    on<LastNameChanged>((event, emit) {
      emit(state.copyWith(lastName: event.lastName));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
    });

    on<RegisterPressed>((event, emit) {
      if (_isFormValid(state)) {
        _onRegisterSubmitted(event, emit);
      }
    });

    on<LoginPressed>((event, emit) {
      emitEffect(NavigateBack());
    });
  }

  bool _isFormValid(RegisterState state) {
    if (state.firstName.isEmpty ||
        state.lastName.isEmpty ||
        state.email.isEmpty ||
        state.password.isEmpty) {
      emitMessage(UiMessage(message: 'All fields are required.'));
      return false;
    }
    // Password validation: minimum 8 characters, at least one number, and at least one symbol.
    if (state.password.length < 8) {
      emitMessage(
          UiMessage(message: 'Password must be at least 8 characters long.'));
      return false;
    }
    bool hasNumber = state.password.contains(RegExp(r'[0-9]'));
    if (!hasNumber) {
      emitMessage(
          UiMessage(message: 'Password must contain at least one number.'));
      return false;
    }
    // Adjusted regex to match any non-alphanumeric character as a symbol.
    bool hasSymbol = state.password.contains(RegExp(r'[^\w\s]'));
    if (!hasSymbol) {
      emitMessage(
          UiMessage(message: 'Password must contain at least one symbol.'));
      return false;
    }
    return true;
  }

  Future<void> _onRegisterSubmitted(
    RegisterPressed event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _registerUseCase.register(
      state.firstName,
      state.lastName,
      state.email,
      state.password,
    );
    emit(state.copyWith(isLoading: false));

    switch (result) {
      case Ok<User>():
        emitEffect(NavigateToVerify());
        break;
      case Error<User>():
        emitMessage(result.error.toUiMessage());
        break;
    }
  }
}
