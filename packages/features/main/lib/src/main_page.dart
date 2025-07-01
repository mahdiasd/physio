import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import 'bloc/main_bloc.dart';
import 'bloc/main_effect.dart';
import 'bloc/main_event.dart';
import 'bloc/main_state.dart';
import 'navigation_item.dart';

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
        NavigateToHome: onHomePressed,
        NavigateToAppointment: onAppointmentsPressed,
        NavigateToProgram: onProgramsPressed,
        NavigateToLibrary: onLibraryPressed,
        NavigateToAccount: onAccountPressed,
      },
      child: MainContent(child: child),
    );
  }
}

class MainContent extends StatefulWidget {
  final Widget child;

  const MainContent({
    super.key,
    required this.child,
  });

  final List<NavigationItem> navigationItems = const [
    HomeNavigationItem(),
    LibraryNavigationItem(),
    ProgramsNavigationItem(),
    AppointmentsNavigationItem(),
    AccountNavigationItem(),
  ];

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  bool isSidebarCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints
        .of(context)
        .isMobile;

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (isMobile) {
          return _buildMobileLayout(context, state);
        } else {
          return _buildDesktopLayout(context, state);
        }
      },
    );
  }

  Widget _buildDesktopLayout(BuildContext context, MainState state) {
    final sidebarWidth = isSidebarCollapsed ? 57.0 : 250.0;

    return Scaffold(
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: sidebarWidth,
            color: Theme
                .of(context)
                .colorScheme
                .surfaceContainerLow,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isSidebarCollapsed)
                    HeadlineMediumText(
                      "Rose Physio HUB",
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    ),
                  if (!isSidebarCollapsed) const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (!isSidebarCollapsed)
                        LabelLargeText(
                          "Menu",
                          color: Color(0xFF6A6A6A),
                        ),
                      AppImage(
                        source: "assets/images/ic_arrow.svg",
                        rotationAngle: isSidebarCollapsed ? 180 : 0,
                        tintColor: Color(0xFF6A6A6A),
                        onTap: () {
                          setState(() {
                            isSidebarCollapsed = !isSidebarCollapsed;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ...() {
                    final sortedItems = [...widget.navigationItems]
                      ..sort((a, b) => a.index.compareTo(b.index));

                    return sortedItems.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _buildSidebarButton(
                          context,
                          item,
                          state.currentNavItem.index == item.index,
                          item.index,
                        ),
                      );
                    });
                  }(),
                ],
              ),
            ),
          ),
          // Main content area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildSidebarButton(BuildContext context,
  //     NavigationItem item,
  //     bool isSelected,
  //     int index,) {
  //   final tintColor =
  //   isSelected ? Theme
  //       .of(context)
  //       .colorScheme
  //       .primary : Color(0xFF6A6A6A);
  //   return InkWell(
  //     borderRadius: BorderRadius.circular(8),
  //     onTap: () =>
  //         context.read<MainBloc>().add(PageChanged(
  //             widget.navigationItems.firstWhere((nav) => nav.index == index))),
  //     child: Row(
  //       children: [
  //         AppImage(
  //           source: item.icon,
  //           tintColor: tintColor,
  //         ),
  //         if (!isSidebarCollapsed) ...[
  //           const SizedBox(width: 8),
  //           LabelLargeText(
  //             item.label,
  //             color: tintColor,
  //           ),
  //         ],
  //       ],
  //     ),
  //   );
  // }

  Widget _buildSidebarButton(
      BuildContext context,
      NavigationItem item,
      bool isSelected,
      int index,
      ) {
    final Color backgroundColor;
    final Color contentColor;

    if (isSelected) {
      backgroundColor = Theme.of(context).colorScheme.primary;
      contentColor = Theme.of(context).colorScheme.onPrimary;
    } else {
      backgroundColor = Colors.transparent;
      contentColor = Color(0xFF6A6A6A);
    }

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => context
          .read<MainBloc>()
          .add(PageChanged(widget.navigationItems.firstWhere((nav) => nav.index == index))),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            AppImage(
              source: item.icon,
              tintColor: contentColor,
            ),
            if (!isSidebarCollapsed) ...[
              const SizedBox(width: 8),
              LabelLargeText(
                item.label,
                color: contentColor,
              ),
            ],
          ],
        ),
      ),
    );}

  Widget _buildMobileLayout(BuildContext context, MainState state) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: state.currentNavItem.index,
        onTap: (index) {
          context.read<MainBloc>().add(PageChanged(
              widget.navigationItems.firstWhere((nav) =>
              nav.index == index)));
        },
        selectedItemColor: Theme
            .of(context)
            .colorScheme
            .primary,
        selectedLabelStyle: Theme
            .of(context)
            .textTheme
            .labelMedium,
        unselectedLabelStyle: Theme
            .of(context)
            .textTheme
            .labelMedium,
        unselectedItemColor: const Color(0xFF6A6A6A),
        items: ([...widget.navigationItems]
          ..sort((a, b) => a.index.compareTo(b.index)))
            .map((item) =>
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: AppImage(
                  source: item.icon,
                ),
              ),
              label: item.label,
            ))
            .toList(),)
      ,
    );
  }
}
