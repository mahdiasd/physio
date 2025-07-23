import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import 'search_effect.dart';
import 'search_event.dart';
import 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState>
    with SideEffectMixin<SearchState, SearchEffect> {
  final GetVideosUseCase _getVideosUseCase;

  void passData(SearchParams? searchParams) {
    add(InitData(searchParams ?? SearchParams()));
    PrintHelper.info(
        searchParams?.toJson().toString() ?? "Search Params is null");
  }

  SearchBloc(this._getVideosUseCase) : super(SearchState()) {
    on<InitData>((event, emit) {
      emit(state.copyWith(searchParams: event.searchParams));
      emit(state.copyWith(
          categories: FakeDataProvider.instance.getFakeVideoCategories()));
      emit(state.copyWith(
          paging: Paging(
              content: FakeDataProvider.instance.getFakeVideoSummeries(count: 25))));
    });

    on<ShowCategoryDialog>((event, emit) {
      emit(state.copyWith(showCategoryDialog: event.show));
    });

    on<OnVideoClick>((event, emit) {
      emitEffect(NavigateToVideoDetail(event.video.id));
    });

    on<CategorySelected>((event, emit) {
      emit(state.copyWith(
          showCategoryDialog: false,
          searchParams:
              state.searchParams?.copyWith(videoCategoryId: event.category)));
      add(OnRefresh());
    });

    on<OnRefresh>((event, emit) async {
      emit(state.copyWith(paging: state.paging.firstPage()));
      await _getVideos(event, emit);
    });

    on<OnLoadMore>((event, emit) async {
      emit(state.copyWith(paging: state.paging.nextPage()));
      await _getVideos(event, emit);
    });

    on<SearchTextChanged>((event, emit) async {
      emit(state.copyWith(searchText: event.text));
      await _getVideos(event, emit);
    });
  }

  Future<void> _getVideos(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    final result = await _getVideosUseCase.invoke(
      page: state.paging.page,
      search: state.searchText.isEmpty ? null : state.searchText,
      tag: state.searchParams?.tag,
      category: state.searchParams?.videoCategoryId,
      isPublic: true,
    );

    switch (result) {
      case Ok<Paging<VideoSummary>>():
        emit(state.copyWith(paging: result.value));
        break;
      case Error<Paging<VideoSummary>>():
        emitMessage(result.error.toUiMessage());
        break;
    }
  }
}
