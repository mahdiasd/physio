class VideoLibraryState {
  final String code;
  final String email;
  final bool isVerified;
  final bool isLoading;
  final bool isResendLoading;

  VideoLibraryState({
    this.code = "",
    this.email = "",
    this.isVerified = false,
    this.isLoading = false,
    this.isResendLoading = false,
  });

  VideoLibraryState copyWith({
    String? code,
    String? email,
    bool? isVerified,
    bool? isLoading,
    bool? isResendLoading,
  }) {
    return VideoLibraryState(
      code: code ?? this.code,
      email: email ?? this.email,
      isVerified: isVerified ?? this.isVerified,
      isLoading: isLoading ?? this.isLoading,
      isResendLoading: isResendLoading ?? this.isResendLoading,
    );
  }
}
