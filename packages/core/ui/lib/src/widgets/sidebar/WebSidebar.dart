import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

const List<NavigationItem> defaultNavigationItems = [
  HomeNavigationItem(),
  LibraryNavigationItem(),
  ProgramsNavigationItem(),
  AppointmentsNavigationItem(),
  AccountNavigationItem(),
];

class WebSidebar extends StatefulWidget {
  final Widget child;
  final List<NavigationItem> navigationItems;
  final NavigationItem? selectedNavItem;
  final ValueChanged<NavigationItem>? onItemTapped;

  const WebSidebar({
    super.key,
    required this.child,
    this.navigationItems = defaultNavigationItems,
    this.selectedNavItem,
    this.onItemTapped,
  });

  @override
  State<WebSidebar> createState() => _WebSidebarState();
}

class _WebSidebarState extends State<WebSidebar> {
  bool isSidebarCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final sidebarWidth = isSidebarCollapsed ? 57.0 : 250.0;

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: sidebarWidth,
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo/Title
                  if (!isSidebarCollapsed)
                    HeadlineMediumText(
                      "Rose Physio HUB",
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  if (!isSidebarCollapsed) const SizedBox(height: 32),

                  // Menu header with collapse button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (!isSidebarCollapsed)
                        const LabelLargeText(
                          "Menu",
                          color: Color(0xFF6A6A6A),
                        ),
                      AppImage(
                        source: "assets/images/ic_arrow.svg",
                        rotationAngle: isSidebarCollapsed ? 180 : 0,
                        tintColor: const Color(0xFF6A6A6A),
                        onTap: () {
                          setState(() {
                            isSidebarCollapsed = !isSidebarCollapsed;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Navigation items
                  ...() {
                    final sortedItems = [...widget.navigationItems]..sort((a, b) => a.index.compareTo(b.index));

                    return sortedItems.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _buildSidebarButton(
                          context,
                          item,
                          widget.selectedNavItem?.index == item.index,
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

  Widget _buildSidebarButton(
    BuildContext context,
    NavigationItem item,
    bool isSelected,
  ) {
    final Color backgroundColor;
    final Color contentColor;

    if (isSelected) {
      backgroundColor = Theme.of(context).colorScheme.primary;
      contentColor = Theme.of(context).colorScheme.onPrimary;
    } else {
      backgroundColor = Colors.transparent;
      contentColor = const Color(0xFF6A6A6A);
    }

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: widget.onItemTapped != null ? () => widget.onItemTapped!(item) : null,
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
    );
  }
}
