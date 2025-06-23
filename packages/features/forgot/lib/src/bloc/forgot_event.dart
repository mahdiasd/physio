sealed class ForgotEvent {}

class EmailChanged extends ForgotEvent {
  final String email;
  EmailChanged(this.email);
}

class SendEmailClick extends ForgotEvent {}
