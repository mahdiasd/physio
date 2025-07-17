import 'package:flutter/material.dart';

class MaxWidthWidget extends StatelessWidget {
  const MaxWidthWidget({
    super.key,
    required this.child,
    required this.maxWidth,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The maximum width to apply to the child.
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
