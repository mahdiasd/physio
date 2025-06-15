import 'package:flutter/material.dart';

class BodyLargeText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color; // حالا null به صورت پیش‌فرض، برای استفاده از رنگ تم
  final TextDirection textDirection;
  final int? maxLines; // حالا null به صورت پیش‌فرض، برای خطوط نامحدود
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const BodyLargeText(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.color, // اگر null باشد، از رنگ پیش‌فرض استایل تم استفاده می‌کند
        this.textDirection = TextDirection.rtl,
        this.maxLines, // اگر null باشد، خطوط نامحدود
        this.overflow = TextOverflow.clip,
        this.softWrap = true,
        this.customStyle,
      });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final defaultStyle = textTheme.bodyLarge;

    return Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: (customStyle ?? defaultStyle)?.copyWith(
        color: color, // اگر color اینجا null باشد، copyWith رنگ قبلی را حفظ می‌کند
      ),
    );
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

  const BodyMediumText(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.color,
        this.textDirection = TextDirection.rtl,
        this.maxLines,
        this.overflow = TextOverflow.clip,
        this.softWrap = true,
        this.customStyle,
      });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final defaultStyle = textTheme.bodyMedium;

    return Text(
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

  const BodySmallText(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.color,
        this.textDirection = TextDirection.rtl,
        this.maxLines,
        this.overflow = TextOverflow.clip,
        this.softWrap = true,
        this.customStyle,
      });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final defaultStyle = textTheme.bodySmall;

    return Text(
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

  const BodyLargeBoldText(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.color,
        this.textDirection = TextDirection.rtl,
        this.maxLines,
        this.overflow = TextOverflow.clip,
        this.softWrap = true,
        this.customStyle,
      });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final defaultStyle = textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold);

    return Text(
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

  const BodyMediumBoldText(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.color,
        this.textDirection = TextDirection.rtl,
        this.maxLines,
        this.overflow = TextOverflow.clip,
        this.softWrap = true,
        this.customStyle,
      });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final defaultStyle = textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold);

    return Text(
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

  const BodySmallBoldText(
      this.text, {
        super.key,
        this.textAlign = TextAlign.start,
        this.color,
        this.textDirection = TextDirection.rtl,
        this.maxLines,
        this.overflow = TextOverflow.clip,
        this.softWrap = true,
        this.customStyle,
      });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final defaultStyle = textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold);

    return Text(
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
  }
}