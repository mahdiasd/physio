import 'package:flutter/material.dart';
import 'base_text.dart';

class TitleLargeText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Section Title - 18px / 500
  const TitleLargeText(
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
      style: Theme.of(context).textTheme.titleLarge,
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

class TitleMediumText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Web Big Card - Detail - 16px / 400
  const TitleMediumText(
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
      style: Theme.of(context).textTheme.titleMedium,
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

class TitleSmallText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// List Title - 15px / 500
  const TitleSmallText(
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
      style: Theme.of(context).textTheme.titleSmall,
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

