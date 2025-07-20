import 'package:flutter/material.dart';

import 'base_text.dart';


class MainButtonText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;


  const MainButtonText(
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
      style: Theme.of(context).textTheme.labelLarge,
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

class BottomNavigationText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Body Text - 14px / 400
  const BottomNavigationText(
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
      style: Theme.of(context).textTheme.labelMedium,
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

class LabelSmallText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Cation - 11px / 400
  const LabelSmallText(
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
      style: Theme.of(context).textTheme.labelSmall,
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