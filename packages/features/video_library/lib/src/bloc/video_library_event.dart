sealed class VideoLibraryEvent {}

class CodeChange extends VideoLibraryEvent {
  final String value;

  CodeChange(this.value);
}

class InitEmail extends VideoLibraryEvent {
  final String email;
  InitEmail(this.email);
}


class VideoLibraryClick extends VideoLibraryEvent {}
class ContinueClick extends VideoLibraryEvent {}
class ResendCodeClicked extends VideoLibraryEvent {}
