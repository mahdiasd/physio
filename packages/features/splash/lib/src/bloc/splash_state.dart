import 'package:domain/domain.dart';

class SplashState {
  final bool isLoading;
  final Config? config;

  SplashState({this.isLoading = true, this.config = null});

  SplashState copyWith({
    bool? isLoading,
    Config? config,
  }) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
      config: config ?? this.config,
    );
  }

}
