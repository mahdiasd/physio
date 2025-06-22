sealed class LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged(this.password);
}

class LoginPressed extends LoginEvent {}

class TogglePasswordVisibility extends LoginEvent {}

class ForgotPasswordPressed extends LoginEvent {}

class RegisterPressed extends LoginEvent {}