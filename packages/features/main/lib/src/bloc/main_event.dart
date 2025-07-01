import 'package:main/src/navigation_item.dart';

abstract class MainEvent {}

class PageChanged extends MainEvent {
  final NavigationItem item;
  PageChanged(this.item);
}