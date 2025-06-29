import 'package:flutter/material.dart';
import 'base_text.dart';

class BodyLargeText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Main Button - 16px / 500
  const BodyLargeText(
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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final defaultStyle = textTheme.bodyLarge;

    final style = (customStyle ?? defaultStyle)
        ?.copyWith(color: color ?? colorScheme.onSurface);

    if (onTap != null) {
      return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft,
        ),
        child: Text(
          text,
          textAlign: textAlign,
          textDirection: textDirection,
          maxLines: maxLines,
          overflow: overflow,
          softWrap: softWrap,
          style: style,
        ),
      );
    } else {
      return Text(
        text,
        textAlign: textAlign,
        textDirection: textDirection,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        style: style,
      );
    }
  }
}

class BodyMediumText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Input Field Title - 15px / 400
  const BodyMediumText(
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
      style: Theme.of(context).textTheme.bodyMedium,
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

class BodySmallText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Placeholder - 14px / 400
  const BodySmallText(
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
    final colorScheme = Theme.of(context).colorScheme;
    return BaseText(
      text: text,
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: textAlign,
      color: color ?? colorScheme.onSurface,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      customStyle: customStyle,
      onTap: onTap,
    );
  }
}
