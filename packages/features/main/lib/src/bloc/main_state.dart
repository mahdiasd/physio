import 'package:main/src/navigation_item.dart';

class MainState {
  final NavigationItem currentNavItem;

  MainState({
    this.currentNavItem = const HomeNavigationItem(),
  });

  MainState copyWith({
    NavigationItem? currentNavItem,
  }) {
    return MainState(
      currentNavItem: currentNavItem ?? this.currentNavItem,
    );
  }
}
