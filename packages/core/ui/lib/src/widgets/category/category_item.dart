import 'package:flutter/material.dart';
import 'package:ui/src/theme/theme_data.dart';
import 'package:ui/src/widgets/clickable/clickable_widget.dart';

import '../text/other_texts.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClickableWidget(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 42,
          minWidth: 100,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: Theme.of(context).radius.smallAll,
        ),
        child: ButtonDownsideText(
          title,
          textAlign: TextAlign.center,
          color: theme.colorScheme.onSecondary,
        ),
      ),
    );
  }
}
