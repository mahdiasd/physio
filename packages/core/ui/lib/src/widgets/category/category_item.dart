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
          maxHeight: 40,
          minWidth: 100,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: Theme.of(context).radius.smallAll,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ButtonDownsideText(
              title,
              textAlign: TextAlign.center,
              color: theme.colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
