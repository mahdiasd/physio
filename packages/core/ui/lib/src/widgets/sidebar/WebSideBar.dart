
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

class WebSidebar extends StatefulWidget {
  final Widget child;
  final VoidCallback? onHomePressed;
  final VoidCallback? onLibraryPressed;
  final VoidCallback? onProgramsPressed;
  final VoidCallback? onAppointmentsPressed;
  final VoidCallback? onAccountPressed;
  final String title;
  final bool showMenuLabel;

  const WebSidebar({
    super.key,
    required this.child,
    this.onHomePressed,
    this.onLibraryPressed,
    this.onProgramsPressed,
    this.onAppointmentsPressed,
    this.onAccountPressed,
    this.title = "Rose Physio HUB",
    this.showMenuLabel = true,
  });

  @override
  State<WebSidebar> createState() => _WebSidebarState();
}

class _WebSidebarState extends State<WebSidebar> {
  bool isSidebarCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    // در موبایل فقط محتوا را نشان می‌دهیم
    if (isMobile) {
      return widget.child;
    }

    // در دسکتاپ سایدبار را نمایش می‌دهیم
    return Scaffold(
      body: Row(
        children: [
          _buildSidebar(context),
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

  Widget _buildSidebar(BuildContext context) {
    final sidebarWidth = isSidebarCollapsed ? 57.0 : 250.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: sidebarWidth,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isSidebarCollapsed)
              HeadlineMediumText(
                widget.title,
                color: Theme.of(context).colorScheme.primary,
              ),
            if (!isSidebarCollapsed) const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!isSidebarCollapsed && widget.showMenuLabel)
                  LabelLargeText(
                    "Menu",
                    color: const Color(0xFF6A6A6A),
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
            _buildNavigationItem(
              context: context,
              icon: "assets/images/ic_home.svg", // باید آیکون‌ها را مطابق با پروژه خود تنظیم کنید
              label: "Home",
              onTap: widget.onHomePressed,
            ),
            _buildNavigationItem(
              context: context,
              icon: "assets/images/ic_library.svg",
              label: "Library",
              onTap: widget.onLibraryPressed,
            ),
            _buildNavigationItem(
              context: context,
              icon: "assets/images/ic_programs.svg",
              label: "Programs",
              onTap: widget.onProgramsPressed,
            ),
            _buildNavigationItem(
              context: context,
              icon: "assets/images/ic_appointments.svg",
              label: "Appointments",
              onTap: widget.onAppointmentsPressed,
            ),
            _buildNavigationItem(
              context: context,
              icon: "assets/images/ic_account.svg",
              label: "Account",
              onTap: widget.onAccountPressed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem({
    required BuildContext context,
    required String icon,
    required String label,
    VoidCallback? onTap,
  }) {
    final contentColor = const Color(0xFF6A6A6A);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              AppImage(
                source: icon,
                tintColor: contentColor,
              ),
              if (!isSidebarCollapsed) ...[
                const SizedBox(width: 8),
                LabelLargeText(
                  label,
                  color: contentColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}