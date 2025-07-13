import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';

// TODO: Import your use cases

import 'video_detail_effect.dart';
import 'video_detail_event.dart';
import 'video_detail_state.dart';

@injectable
class VideoDetailBloc extends Bloc<VideoDetailEvent, VideoDetailState>
    with SideEffectMixin<VideoDetailState, VideoDetailEffect> {

  VideoDetailBloc() : super(VideoDetailState()) {
    on<InitData>((event, emit) {
      emit(state.copyWith(videoId: event.videoId));
      emit(state.copyWith(video: FakeDataProvider.instance.getFakeVideos(count: 10).first));
      emit(state.copyWith(relatedVideos: FakeDataProvider.instance.getFakeVideos(count: 10)));
    });
  }

  void passData(String videoId) {
    add(InitData(videoId));
  }

// TODO: Implement your event handlers
/*
  Future<void> _onSomeEvent(
    SomeEvent event,
    Emitter<video_playerState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    
    // TODO: Implement your logic
    
    emit(state.copyWith(isLoading: false));
  }
  */
}
