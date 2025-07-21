class LoginState {
  final String email;
  final String password;
  final bool isLoading;
  final bool isShowResetPassDialog;
  final bool isPasswordObscured;

  LoginState({
    this.email = 'mahdiasd76@gmail.com',
    this.password = 'M12345678m@',
    this.isLoading = false,
    this.isShowResetPassDialog = false,
    this.isPasswordObscured = true,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    bool? isShowResetPassDialog,
    bool? isPasswordObscured,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isShowResetPassDialog: isShowResetPassDialog ?? this.isShowResetPassDialog,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
    );
  }
}