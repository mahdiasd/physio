sealed class RegisterEvent {}

class FirstNameChanged extends RegisterEvent {
  final String firstName;
  FirstNameChanged(this.firstName);
}

class LastNameChanged extends RegisterEvent {
  final String lastName;
  LastNameChanged(this.lastName);
}

class EmailChanged extends RegisterEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends RegisterEvent {
  final String password;
  PasswordChanged(this.password);
}



class RegisterPressed extends RegisterEvent {}

class TogglePasswordVisibility extends RegisterEvent {}

class LoginPressed extends RegisterEvent {}