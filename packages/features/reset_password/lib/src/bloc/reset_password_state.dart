class ResetPasswordState {
  final List<String> codes;
  final bool isVerified;
  final bool isLoading;
  final bool isResendLoading;

  ResetPasswordState({
    this.codes = const ['', '', '', ''],
    this.isVerified = false,
    this.isLoading = false,
    this.isResendLoading = false,
  });

  ResetPasswordState copyWith({
    List<String>? codeDigits,
    bool? isVerified,
    bool? isLoading,
    bool? isResendLoading,
  }) {
    return ResetPasswordState(
      codes: codeDigits ?? this.codes,
      isVerified: isVerified ?? this.isVerified,
      isLoading: isLoading ?? this.isLoading,
      isResendLoading: isResendLoading ?? this.isResendLoading,
    );
  }
}
