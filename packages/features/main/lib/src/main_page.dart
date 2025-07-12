import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import 'bloc/main_bloc.dart';
import 'bloc/main_effect.dart';
import 'bloc/main_event.dart';
import 'bloc/main_state.dart';

class MainPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateToHome: (_) => onHomePressed(),
        NavigateToAppointment: (_) => onAppointmentsPressed(),
        NavigateToProgram: (_) => onProgramsPressed(),
        NavigateToLibrary: (_) => onLibraryPressed(),
        NavigateToAccount: (_) => onAccountPressed(),
      },
      child: MainContent(
        child: child,
        onHomePressed: onHomePressed,
        onLibraryPressed: onLibraryPressed,
        onProgramsPressed: onProgramsPressed,
        onAppointmentsPressed: onAppointmentsPressed,
        onAccountPressed: onAccountPressed,
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
