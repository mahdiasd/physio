sealed class ForgotEvent {}

class EmailChanged extends ForgotEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends ForgotEvent {
  final String password;
  PasswordChanged(this.password);
}

class ForgotPressed extends ForgotEvent {}

class TogglePasswordVisibility extends ForgotEvent {}

class ForgotPasswordPressed extends ForgotEvent {}

class RegisterPressed extends ForgotEvent {}