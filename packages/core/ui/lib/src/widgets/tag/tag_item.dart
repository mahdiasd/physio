import 'package:flutter/material.dart';

import '../../../ui.dart';

class TagItem extends StatelessWidget {
  final String tag;
  final VoidCallback? onTap;

  const TagItem({
    super.key,
    required this.tag,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClickableWidget(
      onTap: onTap,
      borderRadius: theme.radius.largeAll,
      enableHoverEffect: true,
      child: SizedBox(
        height: 28,
        child: BottomNavigationText(tag),
      ),
    );
  }
}

