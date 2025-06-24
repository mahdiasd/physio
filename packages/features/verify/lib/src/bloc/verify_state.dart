class VerifyState {
  final List<String> codeDigits;
  final bool isVerified;
  final bool isLoading;

  VerifyState({
    this.codeDigits = const ['', '', '', ''],
    this.isVerified = false,
    this.isLoading = false,
  });

  VerifyState copyWith({
    List<String>? codeDigits,
    bool? isVerified,
    bool? isLoading,
  }) {
    return VerifyState(
      codeDigits: codeDigits ?? this.codeDigits,
      isVerified: isVerified ?? this.isVerified,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
