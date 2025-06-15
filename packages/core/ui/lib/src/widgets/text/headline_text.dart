import 'package:flutter/material.dart';

class HeadlineLargeText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const HeadlineLargeText(
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
    final defaultStyle = textTheme.headlineLarge;

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

class HeadlineMediumText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const HeadlineMediumText(
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
    final defaultStyle = textTheme.headlineMedium;

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

class HeadlineSmallText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const HeadlineSmallText(
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
    final defaultStyle = textTheme.headlineSmall;

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


class HeadlineLargeBoldText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const HeadlineLargeBoldText(
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
    final defaultStyle = textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold);

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

class HeadlineMediumBoldText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const HeadlineMediumBoldText(
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
    final defaultStyle = textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold);

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

class HeadlineSmallBoldText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const HeadlineSmallBoldText(
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
    final defaultStyle = textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold);

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