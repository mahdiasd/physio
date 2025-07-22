import 'package:domain/domain.dart';
import 'package:ui/ui.dart';

sealed class SearchEvent {}

class OnFilterClick extends SearchEvent {}

class OnRefresh extends SearchEvent {}

class OnLoadMore extends SearchEvent {}

class SearchTextChanged extends SearchEvent {
  final String text;

  SearchTextChanged(this.text);
}

class ShowCategoryDialog extends SearchEvent {
  final bool show;

  ShowCategoryDialog(this.show);
}

class OnVideoClick extends SearchEvent {
  final VideoSummary video;

  OnVideoClick(this.video);
}

class CategorySelected extends SearchEvent {
  final String category;

  CategorySelected(this.category);
}

class InitData extends SearchEvent {
  final SearchParams searchParams;

  InitData(this.searchParams);
}
