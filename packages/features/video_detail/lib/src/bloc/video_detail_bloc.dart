import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart' hide Video;
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import 'video_detail_effect.dart';
import 'video_detail_event.dart';
import 'video_detail_state.dart';

@injectable
class VideoDetailBloc extends Bloc<VideoDetailEvent, VideoDetailState> with SideEffectMixin<VideoDetailState, VideoDetailEffect> {
  final FlagVideoUseCase _flagVideoUseCase;
  final GetVideoUseCase _getVideoUseCase;

  final Player player = Player();
  late final VideoController controller;

  VideoDetailBloc(this._flagVideoUseCase, this._getVideoUseCase) : super(VideoDetailState()) {
    PrintHelper.info("Video bloc init");
    controller = VideoController(player);
    on<InitData>((event, emit) {
      emit(state.copyWith(videoId: event.videoId));
      emit(state.copyWith(video: FakeDataProvider.instance
          .getFakeVideos(1)
          .first));
    });

    on<OnRelatedVideoClick>((event, emit) {
      player.dispose();
      emitEffect(NavigateToVideoDetail(event.video.id));
    });

    on<FlagPressed>((event, emit) async {
      await _flagVideo(event, emit);
    });
  }

  void passData(String videoId) {
    add(InitData(videoId));
  }

  Future<void> _flagVideo(VideoDetailEvent event, Emitter<VideoDetailState> emit) async {
    final result = await _flagVideoUseCase.invoke(id: state.videoId);

    switch (result) {
      case Ok<bool>():
        emit(state.copyWith(video: state.video?.copyWith(isFlagged: true)));
        break;
      case Error<bool>():
        emitMessage(result.error.toUiMessage());
        break;
    }
  }

  Future<void> _getVideo(VideoDetailEvent event, Emitter<VideoDetailState> emit) async {
    final result = await _getVideoUseCase.invoke(id: state.videoId);

    switch (result) {
      case Ok<Video>():
        emit(state.copyWith(video: result.value));
        break;
      case Error<Video>():
        emitMessage(result.error.toUiMessage());
        break;
    }
  }

  @override
  Future<void> close() {
    PrintHelper.info("Video bloc close");
    return super.close();
  }
}
