class VerifyState {
  final List<String> codes;
  final bool isVerified;
  final bool isLoading;

  VerifyState({
    this.codes = const ['', '', '', ''],
    this.isVerified = false,
    this.isLoading = false,
  });

  VerifyState copyWith({
    List<String>? codeDigits,
    bool? isVerified,
    bool? isLoading,
  }) {
    return VerifyState(
      codes: codeDigits ?? this.codes,
      isVerified: isVerified ?? this.isVerified,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
