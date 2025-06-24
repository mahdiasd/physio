class VerifyState {
  final List<String> codes;
  final bool isVerified;
  final bool isLoading;
  final bool isResendLoading;

  VerifyState({
    this.codes = const ['', '', '', ''],
    this.isVerified = false,
    this.isLoading = false,
    this.isResendLoading = false,
  });

  VerifyState copyWith({
    List<String>? codeDigits,
    bool? isVerified,
    bool? isLoading,
    bool? isResendLoading,
  }) {
    return VerifyState(
      codes: codeDigits ?? this.codes,
      isVerified: isVerified ?? this.isVerified,
      isLoading: isLoading ?? this.isLoading,
      isResendLoading: isResendLoading ?? this.isResendLoading,
    );
  }
}
