sealed class VerifyEvent {}

class EmailChanged extends VerifyEvent {
  final String email;
  EmailChanged(this.email);
}

class CodeChange extends VerifyEvent {
  final String value;

  CodeChange(this.value);
}

class InitEmail extends VerifyEvent {
  final String email;
  InitEmail(this.email);
}


class VerifyClick extends VerifyEvent {}
class ContinueClick extends VerifyEvent {}
class ResendCodeClicked extends VerifyEvent {}
