class LoginState {
  final String email;
  final String password;
  final bool isLoading;
  final bool isPasswordObscured;

  LoginState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.isPasswordObscured = true,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    bool? isPasswordObscured,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
    );
  }
}