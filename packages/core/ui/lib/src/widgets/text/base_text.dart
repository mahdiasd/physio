import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final Color? color;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  const BaseText({
    super.key,
    required this.text,
    required this.style,
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
    final finalStyle = (customStyle ?? style)?.copyWith(color: color);

    if (onTap != null) {
      return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
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
          style: finalStyle,
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
        style: finalStyle,
      );
    }
  }
}

/// ===============================
/// 📋 Text Type → Widget Mapping
/// ===============================
///
/// | Text Type                      | Weight      | Size  | Widget Name            |
/// |--------------------------------|-------------|-------|------------------------|
/// | Page Header                    | SemiBold 600 | 36px | DisplayLargeText       |
/// | Web Big Card - Date & Time     | Medium 500  | 22px  | HeadlineLargeText      |
/// | Page Subtitle                  | Regular 400 | 20px  | HeadlineMediumText     |
/// | Page Title                     | SemiBold 600 | 20px | HeadlineSmallText      |
/// | Section Title                  | Medium 500  | 18px  | TitleLargeText         |
/// | Web Big Card - Detail          | Regular 400 | 16px  | TitleMediumText        |
/// | List Title                     | Medium 500  | 15px  | TitleSmallText         |
/// | Main Button                    | Medium 500  | 16px  | BodyLargeText          |
/// | Input Field Title              | Regular 400 | 15px  | BodyMediumText         |
/// | Placeholder                    | Regular 400 | 14px  | BodySmallText          |
/// | Card Tile                      | SemiBold 600 | 14px | LabelLargeText         |
/// | Body                           | Regular 400 | 14px  | LabelMediumText        |
/// | Button Downside Clickable      | SemiBold 600 | 14px | LabelSmallText         |
///
/// -------------------------------
/// 🟢 Not Implemented Yet (Optional):
///
/// | Text Type                  | Weight      | Size  |
/// |----------------------------|-------------|-------|
/// | Bottom Navigation          | Medium 500  | 12px  |
/// | List Item Title            | Regular 400 | 10px  |
/// | List Item Subtitle         | Regular 400 | 9px   |
/// | List Item Title (Big)      | Regular 400 | 13px  |
/// | List Item Subtitle (Big)   | Regular 400 | 12px  |
/// | Captions                   | Regular 400 | 11px  |
///
/// ===============================
