import 'package:domain/domain.dart';

sealed class VideoDetailEvent {}

class InitData extends VideoDetailEvent {
  final String videoId;

  InitData(this.videoId);
}

class OnRelatedVideoClick extends VideoDetailEvent {
  final VideoSummary video;

  OnRelatedVideoClick(this.video);
}

class FlagPressed extends VideoDetailEvent {}
