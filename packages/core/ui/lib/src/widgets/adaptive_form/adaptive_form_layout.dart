import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AdaptiveFormLayout extends StatelessWidget {
  final Widget child;
  final double minHeight;

  const AdaptiveFormLayout({
    super.key,
    required this.child,
    this.minHeight = 800,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final screenHeight = MediaQuery.of(context).size.height;
    final availableHeight = screenHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    if (isMobile) {
      return SafeArea(
        child: child,
      );
    }

    if (availableHeight >= minHeight) {
      return SizedBox(
        height: minHeight,
        child: child,
      );
    } else {
      return SizedBox(
        height: availableHeight,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: minHeight),
            child: child,
          ),
        ),
      );
    }
  }
}
