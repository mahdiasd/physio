class RegisterState {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final bool isLoading;
  final bool isPasswordObscured;

  RegisterState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.isPasswordObscured = true,
  });

  RegisterState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    bool? isLoading,
    bool? isPasswordObscured,
    String? errorMessage,
  }) {
    return RegisterState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
    );
  }
}