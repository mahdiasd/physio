sealed class VerifyEvent {}

class EmailChanged extends VerifyEvent {
  final String email;
  EmailChanged(this.email);
}

class SendEmailClick extends VerifyEvent {}
