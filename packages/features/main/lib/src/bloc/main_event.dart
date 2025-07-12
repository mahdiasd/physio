import 'package:ui/ui.dart';

abstract class MainEvent {}

class PageChanged extends MainEvent {
  final NavigationItem item;
  PageChanged(this.item);
}