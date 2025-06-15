import 'package:flutter/material.dart';

class LabelLargeText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const LabelLargeText(
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
    final defaultStyle = textTheme.labelLarge;

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

class LabelMediumText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const LabelMediumText(
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
    final defaultStyle = textTheme.labelMedium;

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

class LabelSmallText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const LabelSmallText(
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
    final defaultStyle = textTheme.labelSmall;

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


class LabelLargeBoldText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const LabelLargeBoldText(
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
    final defaultStyle = textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold);

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

class LabelMediumBoldText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const LabelMediumBoldText(
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
    final defaultStyle = textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold);

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

class LabelSmallBoldText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;

  const LabelSmallBoldText(
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
    final defaultStyle = textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold);

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