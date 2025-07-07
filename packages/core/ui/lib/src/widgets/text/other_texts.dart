import 'package:flutter/material.dart';
import 'package:ui/src/theme/text_theme.dart';

import 'base_text.dart';

// Make sure to import your text_theme.dart and BaseText widget
// import 'text_theme.dart';
// import 'base_text.dart'; // Or wherever BaseText is defined

// For cardTile
class CardTileText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Card Tile - SemiBold (600) - 14px
  const CardTileText(this.text, {
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
      style: Theme
          .of(context)
          .textTheme
          .cardTile,
      textAlign: textAlign,
      color: color,
      // Pass color to BaseText to handle override
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      customStyle: customStyle,
      onTap: onTap,
    );
  }
}

// For buttonDownside
class ButtonDownsideText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Button Downside Clickable - SemiBold (600) - 14px
  const ButtonDownsideText(this.text, {
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
      style: Theme
          .of(context)
          .textTheme
          .buttonDownside,
      textAlign: textAlign,
      color: color,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      customStyle: customStyle,
      onTap: onTap,
    );
  }
}

// For inputFieldTitle
class InputFieldTitleText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// Input Field Title - Regular (400) - 15px
  const InputFieldTitleText(this.text, {
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
      style: Theme
          .of(context)
          .textTheme
          .inputFieldTitle,
      textAlign: textAlign,
      color: color,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      customStyle: customStyle,
      onTap: onTap,
    );
  }
}

// For listItemTitle
class ListItemTitleText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// List Item Title - Regular (400) - 10px
  const ListItemTitleText(this.text, {
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
      style: Theme
          .of(context)
          .textTheme
          .listItemTitle,
      textAlign: textAlign,
      color: color,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      customStyle: customStyle,
      onTap: onTap,
    );
  }
}

// For listItemSubtitle
class ListItemSubtitleText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// List Item Subtitle - Regular (400) - 9px
  const ListItemSubtitleText(this.text, {
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
      style: Theme
          .of(context)
          .textTheme
          .listItemSubtitle,
      textAlign: textAlign,
      color: color,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      customStyle: customStyle,
      onTap: onTap,
    );
  }
}

// For extraBold
class ExtraBoldText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// برای استفاده‌های خاص - Bold
  const ExtraBoldText(this.text, {
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
      style: Theme
          .of(context)
          .textTheme
          .extraBold,
      textAlign: textAlign,
      color: color,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      customStyle: customStyle,
      onTap: onTap,
    );
  }
}

// For light
class LightText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// برای استفاده‌های خاص - Light
  const LightText(this.text, {
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
      style: Theme
          .of(context)
          .textTheme
          .light,
      textAlign: textAlign,
      color: color,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      customStyle: customStyle,
      onTap: onTap,
    );
  }
}

// For extraLight
class ExtraLightText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  /// برای استفاده‌های خاص - Extra Light
  const ExtraLightText(this.text, {
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
      style: Theme
          .of(context)
          .textTheme
          .extraLight,
      textAlign: textAlign,
      color: color,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      customStyle: customStyle,
      onTap: onTap,
    );
  }
}
