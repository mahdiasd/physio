import 'package:ui/ui.dart';

sealed class SearchEvent {}

class OnFilterClick extends SearchEvent {}

class OnRefresh extends SearchEvent {}

class OnLoadMore extends SearchEvent {}

class SearchTextChanged extends SearchEvent {
  final String password;

  SearchTextChanged(this.password);
}

class InitData extends SearchEvent {
  final SearchParam searchParams;

  InitData(this.searchParams);
}
