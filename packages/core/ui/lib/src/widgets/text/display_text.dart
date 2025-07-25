import 'package:flutter/material.dart';

import 'base_text.dart';

/// Page Header - SemiBold (600) - 36px
class PageHeaderText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Page Header - SemiBold (600) - 36px
  const PageHeaderText(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.color,
    this.textDirection = TextDirection.ltr,
    this.maxLines,
    this.overflow = TextOverflow.clip,
    this.softWrap = true,
    this.customStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      style: Theme.of(context).textTheme.displaySmall,
      textAlign: textAlign,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      customStyle: customStyle,
      onTap: onTap,
    );
  }
}
