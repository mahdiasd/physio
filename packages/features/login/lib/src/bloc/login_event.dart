sealed class LoginEvent {
  const LoginEvent();
}

class UsernameChanged extends LoginEvent {
  final String username;
  const UsernameChanged(this.username);
}

class PasswordChanged extends LoginEvent {
  final String password;
  const PasswordChanged(this.password);
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}