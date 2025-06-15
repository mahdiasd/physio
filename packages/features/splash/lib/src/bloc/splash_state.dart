import 'package:domain/domain.dart';

class SplashState {
  final bool isLoading;
  final Config? config;
  final UpdateState? updateState;

  SplashState({
    this.isLoading = true,
    this.config = null,
    this.updateState = null,
  });

  SplashState copyWith({
    bool? isLoading,
    UpdateState? updateState,
    Config? config,
  }) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
      updateState: updateState ?? this.updateState,
      config: config ?? this.config,
    );
  }
}
