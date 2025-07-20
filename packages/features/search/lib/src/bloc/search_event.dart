import 'package:ui/ui.dart';

sealed class SearchEvent {}

class OnFilterClick extends SearchEvent {}

class OnRefresh extends SearchEvent {}

class OnLoadMore extends SearchEvent {}

class SearchTextChanged extends SearchEvent {
  final String password;

  SearchTextChanged(this.password);
}

class ShowCategoryDialog extends SearchEvent {
  final bool show;

  ShowCategoryDialog(this.show);
}

class CategorySelected extends SearchEvent {
  final String category;

  CategorySelected(this.category);
}

class InitData extends SearchEvent {
  final SearchParams searchParams;

  InitData(this.searchParams);
}
