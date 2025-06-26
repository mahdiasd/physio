class VerifyState {
  final String code;
  final String email;
  final bool isVerified;
  final bool isLoading;
  final bool isResendLoading;

  VerifyState({
    this.code = "",
    this.email = "",
    this.isVerified = false,
    this.isLoading = false,
    this.isResendLoading = false,
  });

  VerifyState copyWith({
    String? code,
    String? email,
    bool? isVerified,
    bool? isLoading,
    bool? isResendLoading,
  }) {
    return VerifyState(
      code: code ?? this.code,
      email: email ?? this.email,
      isVerified: isVerified ?? this.isVerified,
      isLoading: isLoading ?? this.isLoading,
      isResendLoading: isResendLoading ?? this.isResendLoading,
    );
  }
}
