sealed class VerifyEvent {}

class EmailChanged extends VerifyEvent {
  final String email;
  EmailChanged(this.email);
}

class CodeDigitChanged extends VerifyEvent {
  final int index;
  final String value;

  CodeDigitChanged(this.index, this.value);
}


class VerifyClick extends VerifyEvent {}
class ContinueClick extends VerifyEvent {}
class ResendCodeClicked extends VerifyEvent {}
