import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:ui/ui.dart';

// TODO: Import your use cases

import 'video_detail_effect.dart';
import 'video_detail_event.dart';
import 'video_detail_state.dart';

@injectable
class VideoDetailBloc extends Bloc<VideoDetailEvent, VideoDetailState> with SideEffectMixin<VideoDetailState, VideoDetailEffect> {
  final Player player = Player();
  late final VideoController controller;

  VideoDetailBloc() : super(VideoDetailState()) {
    controller = VideoController(player);
    on<InitData>((event, emit) {
      emit(state.copyWith(videoId: event.videoId));
      emit(state.copyWith(video: FakeDataProvider.instance.getFakeVideos(1).first));
    });

    on<OnRelatedVideoClick>((event, emit) {
      emitEffect(NavigateToVideoDetail(event.video.id));
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
