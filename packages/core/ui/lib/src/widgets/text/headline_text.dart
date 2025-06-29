import 'package:flutter/material.dart';
import 'base_text.dart';

class HeadlineLargeText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Web Big Card - Date & Time - 22px / 500
  const HeadlineLargeText(
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
      style: Theme.of(context).textTheme.headlineLarge,
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

class HeadlineMediumText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Page Subtitle - 20px / 400
  const HeadlineMediumText(
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
      style: Theme.of(context).textTheme.headlineMedium,
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

class HeadlineSmallText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Page Title - 20px / 600
  const HeadlineSmallText(
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
      style: Theme.of(context).textTheme.headlineSmall,
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
