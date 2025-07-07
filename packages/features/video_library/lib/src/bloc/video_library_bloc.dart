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
  final ResendOTPUseCase _resendOTPUseCase;

  VideoLibraryBloc(this._resendOTPUseCase) : super(VideoLibraryState()) {

  }

  Future<void> _onVideoLibrary(
    VideoLibraryEvent event,
    Emitter<VideoLibraryState> emit,
  ) async {
    if (state.code.length != 4) {
      emitMessage(UiMessage(message: "Please enter all 4 digits of the code correctly."));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final result = await _resetPasswordUseCase.invoke(
      email: state.email,
      code: state.code,
      password: state.password,
      confirmPassword: state.confirmPassword,
    );

    emit(state.copyWith(isLoading: false));

    switch (result) {
      case Ok<bool>():
        emitMessage(UiMessage.success("Password change successfully"));
        await Future<void>.delayed(Duration(seconds: 3));
        emitEffect(NavigateToMain());
        break;
      case Error<bool>():
        emitMessage(result.error.toUiMessage());
        break;
    }
  }

}
