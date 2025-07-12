import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClickableWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final bool enableHoverEffect;
  final Color? hoverColor;
  final BorderRadius? borderRadius;
  final SystemMouseCursor cursor;
  final bool enableSplash;

  const ClickableWidget({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.enableHoverEffect = true,
    this.hoverColor,
    this.borderRadius,
    this.cursor = SystemMouseCursors.click,
    this.enableSplash = true,
  });

  @override
  State<ClickableWidget> createState() => _ClickableWidgetState();
}

class _ClickableWidgetState extends State<ClickableWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isClickable = widget.onTap != null ||
        widget.onLongPress != null ||
        widget.onDoubleTap != null;

    if (!isClickable) {
      return widget.child;
    }

    Widget child = widget.child;

    // Add hover effect if enabled
    if (widget.enableHoverEffect && _isHovered) {
      child = ColoredBox(
        color: widget.hoverColor ?? theme.colorScheme.primary.withValues(alpha: 0.04),
        child: child,
      );
    }

    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onDoubleTap: widget.onDoubleTap,
        child: widget.enableSplash
            ? InkWell(
          onTap: widget.onTap,
          onLongPress: widget.onLongPress,
          onDoubleTap: widget.onDoubleTap,
          borderRadius: widget.borderRadius,
          splashColor: theme.colorScheme.primary.withValues(alpha: 0.1),
          highlightColor: theme.colorScheme.primary.withValues(alpha: 0.05),
          child: child,
        )
            : child,
      ),
    );
  }
}


class SimpleClickable extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final SystemMouseCursor cursor;

  const SimpleClickable({
    super.key,
    required this.child,
    this.onTap,
    this.cursor = SystemMouseCursors.click,
  });

  @override
  Widget build(BuildContext context) {
    if (onTap == null) return child;

    return MouseRegion(
      cursor: cursor,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}