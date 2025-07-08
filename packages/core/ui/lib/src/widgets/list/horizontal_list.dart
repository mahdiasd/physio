import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveHorizontalList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final double itemSpacing;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool showScrollbar;
  final Widget? emptyStateWidget;
  final ScrollController? controller;

  const ResponsiveHorizontalList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.itemSpacing = 12.0,
    this.height,
    this.padding,
    this.physics,
    this.showScrollbar = false,
    this.emptyStateWidget,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty && emptyStateWidget != null) {
      return emptyStateWidget!;
    }

    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    List<Widget> children = [];
    for (int i = 0; i < items.length; i++) {
      children.add(itemBuilder(context, items[i], i));
      if (i < items.length - 1) {
        children.add(SizedBox(width: itemSpacing));
      }
    }

    Widget scrollView = SingleChildScrollView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      padding: padding,
      physics: physics,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );

    if (!isMobile) {
      scrollView = ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
          scrollbars: showScrollbar,
        ),
        child: scrollView,
      );
    }

    if (showScrollbar && isMobile) {
      scrollView = Scrollbar(
        controller: controller,
        thumbVisibility: true,
        child: scrollView,
      );
    }

    if (height != null) {
      return SizedBox(
        height: height,
        width: double.infinity,
        child: scrollView,
      );
    }

    return scrollView;
  }
}