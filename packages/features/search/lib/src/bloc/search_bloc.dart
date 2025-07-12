import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';
import 'search_effect.dart';
import 'search_event.dart';
import 'search_state.dart';
import 'package:domain/src/faker/fake_data_provider.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> with SideEffectMixin<SearchState, SearchEffect> {
  // TODO: Add your use cases here
  // final SomeUseCase _someUseCase;

  void passData(SearchParams? searchParams) {
    add(InitData(searchParams ?? SearchParams()));
    PrintHelper.info(searchParams?.toJson().toString() ?? "Search Params is null");
  }

  SearchBloc() : super(SearchState()) {
    on<InitData>((event, emit) {
      emit(state.copyWith(searchParams: event.searchParams));
      emit(state.copyWith(paging: Paging(content: FakeDataProvider.instance.getFakeVideos(count: 20))));
    });

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
