import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import 'bloc/main_bloc.dart';
import 'bloc/main_effect.dart';
import 'bloc/main_event.dart';
import 'bloc/main_state.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  final VoidCallback onHomePressed;
  final VoidCallback onLibraryPressed;
  final VoidCallback onProgramsPressed;
  final VoidCallback onAppointmentsPressed;
  final VoidCallback onAccountPressed;

  const MainPage({
    super.key,
    required this.child,
    required this.onHomePressed,
    required this.onLibraryPressed,
    required this.onProgramsPressed,
    required this.onAppointmentsPressed,
    required this.onAccountPressed,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with RouteAware {
  RouteObserver<PageRoute<void>>? _routeObserver;

  @override
  void initState() {
    super.initState();
    // Initialize the route observer only once here
    _routeObserver = RouteObserver<PageRoute<void>>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateNavigationItem();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Unsubscribe first to avoid multiple subscriptions if didChangeDependencies is called multiple times
    _routeObserver?.unsubscribe(this);
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      _routeObserver?.subscribe(this, route as PageRoute<void>);
    }
  }

  @override
  void didUpdateWidget(MainPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateNavigationItem();
      });
    }
  }

  @override
  void didPopNext() {
    _updateNavigationItem();
  }

  void _updateNavigationItem() {
    final router = GoRouter.of(context);
    final location = router.routerDelegate.currentConfiguration.uri.path;
    final navItem = _getNavigationItemFromLocation(location);

    final currentItem = context.read<MainBloc>().state.currentNavItem;
    if (currentItem.runtimeType != navItem.runtimeType) {
      context.read<MainBloc>().add(PageChanged(navItem));
    }
  }

  NavigationItem _getNavigationItemFromLocation(String location) {
    if (location.startsWith('/home')) {
      return const HomeNavigationItem();
    } else if (location.startsWith('/library')) {
      return const LibraryNavigationItem();
    } else if (location.startsWith('/programs')) {
      return const ProgramsNavigationItem();
    } else if (location.startsWith('/appointment')) {
      return const AppointmentsNavigationItem();
    } else if (location.startsWith('/account')) {
      return const AccountNavigationItem();
    }
    return const LibraryNavigationItem();
  }

  @override
  void dispose() {
    // Clean up the observer to prevent memory leaks
    _routeObserver?.unsubscribe(this);
    _routeObserver = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateToHome: (_) => widget.onHomePressed(),
        NavigateToAppointment: (_) => widget.onAppointmentsPressed(),
        NavigateToProgram: (_) => widget.onProgramsPressed(),
        NavigateToLibrary: (_) => widget.onLibraryPressed(),
        NavigateToAccount: (_) => widget.onAccountPressed(),
      },
      child: MainContent(
        child: widget.child,
        onHomePressed: widget.onHomePressed,
        onLibraryPressed: widget.onLibraryPressed,
        onProgramsPressed: widget.onProgramsPressed,
        onAppointmentsPressed: widget.onAppointmentsPressed,
        onAccountPressed: widget.onAccountPressed,
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  final Widget child;
  final VoidCallback onHomePressed;
  final VoidCallback onLibraryPressed;
  final VoidCallback onProgramsPressed;
  final VoidCallback onAppointmentsPressed;
  final VoidCallback onAccountPressed;

  const MainContent({
    super.key,
    required this.child,
    required this.onHomePressed,
    required this.onLibraryPressed,
    required this.onProgramsPressed,
    required this.onAppointmentsPressed,
    required this.onAccountPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (isMobile) {
          return _buildMobileLayout(context, state);
        } else {
          return WebSidebar(
            selectedNavItem: state.currentNavItem,
            onItemTapped: (item) {
              context.read<MainBloc>().add(PageChanged(item));
            },
            child: child,
          );
        }
      },
    );
  }

  Widget _buildMobileLayout(BuildContext context, MainState state) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: state.currentNavItem.index,
        onTap: (index) {
          context.read<MainBloc>().add(PageChanged(defaultNavigationItems.firstWhere((nav) => nav.index == index)));
        },
        selectedItemColor: Theme.of(context).colorScheme.primary,
        selectedLabelStyle: Theme.of(context).textTheme.labelMedium,
        unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
        unselectedItemColor: const Color(0xFF6A6A6A),
        items: ([...defaultNavigationItems]..sort((a, b) => a.index.compareTo(b.index)))
            .map((item) => BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: AppImage(
              source: item.icon,
            ),
          ),
          label: item.label,
        ))
            .toList(),
      ),
    );
  }
}