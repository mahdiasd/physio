import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';
import 'package:utils/src/model/result.dart';
import 'package:video_library/src/bloc/video_library_effect.dart';
import 'package:video_library/src/bloc/video_library_event.dart';
import 'package:video_library/src/bloc/video_library_state.dart';

@injectable
class VideoLibraryBloc extends Bloc<VideoLibraryEvent, VideoLibraryState> with SideEffectMixin<VideoLibraryState, VideoLibraryEffect> {
  final GetLibraryUseCase _getLibraryUseCase;

  VideoLibraryBloc(this._getLibraryUseCase) : super(VideoLibraryState()) {
    on<OnRefresh>(_getLibrary);

    on<OnSearchClick>((event, emit) {
      emitEffect(NavigateToSearch(null));
    });

    on<OnSelectCategory>((event, emit) {
    });

    on<OnMoreRecentVideosClick>((event, emit) {
    });

    on<OnMoreMostViewedVideosClick>((event, emit) {

    });

    on<OnMoreShouldersVideosClick>((event, emit) {

    });

    on<OnMoreBlogPostClick>((event, emit) {

    });

    on<OnMoreCategoriesClick>((event, emit) {

    });

    on<OnVideoClick>((event, emit) {

    });

    on<OnBlogPostClick>((event, emit) {

    });

    add(OnRefresh());
  }

  Future<void> _getLibrary(
      VideoLibraryEvent event,
      Emitter<VideoLibraryState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getLibraryUseCase.invoke();

    emit(state.copyWith(isLoading: false));

    switch (result) {
      case Ok<VideoLibrary>():
        emit(state.copyWith(library: result.value));
        break;
      case Error<VideoLibrary>():
        emitMessage(result.error.toUiMessage());
        break;
    }
  }
}