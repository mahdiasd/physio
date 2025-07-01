import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/src/navigation_item.dart';
import 'package:ui/ui.dart';
import 'main_effect.dart';
import 'main_event.dart';
import 'main_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState>
    with SideEffectMixin<MainState, MainEffect> {
  MainBloc() : super(MainState()) {
    on<PageChanged>((event, emit) {
      emit(state.copyWith(currentNavItem: event.item));

      switch (event.item) {
        case HomeNavigationItem():
          emitEffect(NavigateToHome());
          break;
        case AppointmentsNavigationItem():
          emitEffect(NavigateToAppointment());
          break;
        case ProgramsNavigationItem():
          emitEffect(NavigateToProgram());
          break;
        case LibraryNavigationItem():
          emitEffect(NavigateToLibrary());
          break;
        case AccountNavigationItem():
          emitEffect(NavigateToAccount());
          break;
      }
    });
  }
}
