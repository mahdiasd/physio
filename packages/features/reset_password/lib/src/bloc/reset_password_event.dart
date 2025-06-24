sealed class ResetPasswordEvent {}

class EmailChanged extends ResetPasswordEvent {
  final String email;
  EmailChanged(this.email);
}

class CodeDigitChanged extends ResetPasswordEvent {
  final int index;
  final String value;

  CodeDigitChanged(this.index, this.value);
}


class ResetPasswordClick extends ResetPasswordEvent {}
class ContinueClick extends ResetPasswordEvent {}
class ResendCodeClicked extends ResetPasswordEvent {}
