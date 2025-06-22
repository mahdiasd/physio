class ForgotState {
  final String email;

  ForgotState({
    this.email = '',
  });

  ForgotState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    bool? isPasswordObscured,
    String? errorMessage,
  }) {
    return ForgotState(
      email: email ?? this.email,
    );
  }
}
