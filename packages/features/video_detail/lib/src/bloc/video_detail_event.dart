sealed class VideoDetailEvent {}

class InitData extends VideoDetailEvent {
  final String videoId;

  InitData(this.videoId);
}

class OnFlagClick extends VideoDetailEvent {}
