sealed class VerifyEvent {}

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
