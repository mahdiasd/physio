import 'package:ui/ui.dart';

class MainState {
  final NavigationItem currentNavItem;

  MainState({
    this.currentNavItem = const LibraryNavigationItem(),
  });

  MainState copyWith({
    NavigationItem? currentNavItem,
  }) {
    return MainState(
      currentNavItem: currentNavItem ?? this.currentNavItem,
    );
  }
}
