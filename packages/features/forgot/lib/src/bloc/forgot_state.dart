class ForgotState {
  final String email;
  final bool isLoading;

  ForgotState({
    this.email = '',
    this.isLoading = false,
  });

  ForgotState copyWith({
    String? email,
    bool? isLoading,
    bool? isResendLoading,
  }) {
    return ForgotState(
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
