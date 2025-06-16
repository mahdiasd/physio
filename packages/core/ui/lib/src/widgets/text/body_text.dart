import 'package:flutter/material.dart';

class BodyLargeText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap; // پراپرتی جدید برای کلیک

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
    final defaultStyle = textTheme.bodyLarge;

    final textWidget = Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: (customStyle ?? defaultStyle)?.copyWith(
        color: color,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: textWidget,
      );
    }
    return textWidget;
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
  final VoidCallback? onTap; // پراپرتی جدید برای کلیک

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
    final textTheme = Theme.of(context).textTheme;
    final defaultStyle = textTheme.bodyMedium;

    final textWidget = Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: (customStyle ?? defaultStyle)?.copyWith(
        color: color,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: textWidget,
      );
    }
    return textWidget;
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
  final VoidCallback? onTap; // پراپرتی جدید برای کلیک

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
    final textTheme = Theme.of(context).textTheme;
    final defaultStyle = textTheme.bodySmall;

    final textWidget = Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: (customStyle ?? defaultStyle)?.copyWith(
        color: color,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: textWidget,
      );
    }
    return textWidget;
  }
}

class BodyLargeBoldText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap; // پراپرتی جدید برای کلیک

  const BodyLargeBoldText(
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
    final defaultStyle =
        textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold);

    final textWidget = Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: (customStyle ?? defaultStyle)?.copyWith(
        color: color,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: textWidget,
      );
    }
    return textWidget;
  }
}

class BodyMediumBoldText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap; // پراپرتی جدید برای کلیک

  const BodyMediumBoldText(
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
    final defaultStyle =
        textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold);

    final textWidget = Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: (customStyle ?? defaultStyle)?.copyWith(
        color: color,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: textWidget,
      );
    }
    return textWidget;
  }
}

class BodySmallBoldText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap; // پراپرتی جدید برای کلیک

  const BodySmallBoldText(
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
    final defaultStyle =
        textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold);

    final textWidget = Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: (customStyle ?? defaultStyle)?.copyWith(
        color: color,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: textWidget,
      );
    }
    return textWidget;
  }
}
