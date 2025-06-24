class VerifyState {
  final String email;
  final bool isLoading;

  VerifyState({
    this.email = '',
    this.isLoading = false,
  });

  VerifyState copyWith({
    String? email,
    bool? isLoading,
  }) {
    return VerifyState(
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
