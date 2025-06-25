// reset_password_event.dart
abstract class ResetPasswordEvent {
  const ResetPasswordEvent();
}

// Updated event to handle the complete code string instead of individual digits
class CodeChanged extends ResetPasswordEvent {
  final String code;

  const CodeChanged(this.code);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CodeChanged && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode;
}

class PasswordChanged extends ResetPasswordEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PasswordChanged && runtimeType == other.runtimeType && password == other.password;

  @override
  int get hashCode => password.hashCode;
}

class RepeatPasswordChanged extends ResetPasswordEvent {
  final String repeatPassword;

  const RepeatPasswordChanged(this.repeatPassword);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RepeatPasswordChanged && runtimeType == other.runtimeType && repeatPassword == other.repeatPassword;

  @override
  int get hashCode => repeatPassword.hashCode;
}

class InitEmail extends ResetPasswordEvent {
  final String email;
  InitEmail(this.email);
}

class TogglePasswordVisibility extends ResetPasswordEvent {
  const TogglePasswordVisibility();
}

class ToggleRepeatPasswordVisibility extends ResetPasswordEvent {
  const ToggleRepeatPasswordVisibility();
}

class ResetPasswordClick extends ResetPasswordEvent {
  const ResetPasswordClick();
}

class ResendCodeClicked extends ResetPasswordEvent {
  const ResendCodeClicked();
}