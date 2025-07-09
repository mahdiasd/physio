import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';
import 'search_effect.dart';
import 'search_event.dart';
import 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> with SideEffectMixin<SearchState, SearchEffect> {
  // TODO: Add your use cases here
  // final SomeUseCase _someUseCase;

  void passData(SearchParam? searchParams) {
    add(InitData(searchParams ?? SearchParam()));
  }

  SearchBloc() : super(SearchState()) {
    // TODO: Register your event handlers
    // on<SomeEvent>(_onSomeEvent);
  }

// TODO: Implement your event handlers
/*
  Future<void> _onSomeEvent(
    SomeEvent event,
    Emitter<searchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    
    // TODO: Implement your logic
    
    emit(state.copyWith(isLoading: false));
  }
  */
}
