import 'package:domain/domain.dart';

class VideoLibraryState {
  final bool isLoading;
  final VideoLibrary? library;

  VideoLibraryState({
    this.isLoading = false,
    this.library = null,
  });

  VideoLibraryState copyWith({
    bool? isLoading,
    VideoLibrary? library,
  }) {
    return VideoLibraryState(
      isLoading: isLoading ?? this.isLoading,
      library: library ?? this.library,
    );
  }
}
