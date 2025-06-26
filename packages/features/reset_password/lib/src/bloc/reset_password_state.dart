class ResetPasswordState {
  final String code;
  final String email;
  final bool isLoading;
  final bool isResendLoading;
  final String password;
  final String repeatPassword;
  final bool isPasswordObscured;
  final bool isRepeatPasswordObscured;

  ResetPasswordState({
    this.code = "",
    this.email = "",
    this.isLoading = false,
    this.isResendLoading = false,
    this.isPasswordObscured = true,
    this.isRepeatPasswordObscured = true,
    this.password = "",
    this.repeatPassword = "",
  });

  ResetPasswordState copyWith({
    String? code,
    String? email,
    bool? isLoading,
    bool? isResendLoading,
    bool? isPasswordObscured,
    bool? isRepeatPasswordObscured,
    String? password,
    String? repeatPassword,
  }) {
    return ResetPasswordState(
      code: code ?? this.code,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
      isResendLoading: isResendLoading ?? this.isResendLoading,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      isRepeatPasswordObscured: isRepeatPasswordObscured ?? this.isRepeatPasswordObscured,
      password: password ?? this.password,
      repeatPassword: repeatPassword ?? this.repeatPassword,
    );
  }
}
