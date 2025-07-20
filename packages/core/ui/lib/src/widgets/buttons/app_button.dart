import 'package:flutter/material.dart';
import 'package:ui/src/widgets/text/body_text.dart';
import 'package:ui/src/widgets/text/label_text.dart';

/// ───────────────────────────────────────────────
///  Primary (Filled) Button
/// ───────────────────────────────────────────────
class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? textColor;
  final double height; // ⬅️ ارتفاع قابل‌تنظیم (پیش‌فرض 48)

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.padding,
    this.elevation,
    this.textColor,
    this.height = 48, // default
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = onPressed == null || isLoading;

    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return const Color(0xFFD0E8E3);
            }
            if (states.contains(WidgetState.hovered)) {
              return _darken(theme.colorScheme.primary, 0.1);
            }
            return theme.colorScheme.primary;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return const Color(0xFF9FB7B2);
            }
            return textColor ?? theme.colorScheme.onPrimary;
          }),
          elevation: WidgetStateProperty.all(elevation ?? 4),
          shadowColor: WidgetStateProperty.all(
            Colors.black.withAlpha((0.1 * 255).round()),
          ),
          textStyle: WidgetStateProperty.all(theme.textTheme.labelLarge),
          padding: WidgetStateProperty.all(
            // فقط Padding افقی؛ ارتفاع توسط SizedBox کنترل می‌شود
            padding ?? const EdgeInsets.symmetric(horizontal: 20),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
          ),
          // دکمۀ ما دقیقاً همان ارتفاع SizedBox را می‌گیرد
          fixedSize: WidgetStateProperty.all(Size.fromHeight(height)),
        ),
        child: isLoading
            ? SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(
                textColor ?? theme.colorScheme.onPrimary),
          ),
        )
            : MainButtonText(
          text,
          color: textColor ?? theme.colorScheme.onPrimary,
        ),
      ),
    );
  }

  Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}

/// ───────────────────────────────────────────────
///  Primary Container (Tonal) Button
/// ───────────────────────────────────────────────
class AppPrimaryContainerButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? textColor;
  final double height; // ⬅️ ارتفاع قابل‌تنظیم (پیش‌فرض 48)

  const AppPrimaryContainerButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.padding,
    this.elevation,
    this.textColor,
    this.height = 48, // default
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDisabled = onPressed == null || isLoading;

    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return const Color(0xFFD0E8E3);
            }
            if (states.contains(WidgetState.hovered)) {
              return _darken(colorScheme.primaryContainer, 0.05);
            }
            return colorScheme.primaryContainer;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return const Color(0xFF9FB7B2);
            }
            return textColor ?? colorScheme.onPrimaryContainer;
          }),
          elevation: WidgetStateProperty.all(elevation ?? 4),
          shadowColor: WidgetStateProperty.all(
            Colors.black.withAlpha((0.1 * 255).round()),
          ),
          padding: WidgetStateProperty.all(
            padding ?? const EdgeInsets.symmetric(horizontal: 20),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
          ),
          fixedSize: WidgetStateProperty.all(Size.fromHeight(height)),
        ),
        child: isLoading
            ? SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(
                textColor ?? colorScheme.onPrimaryContainer),
          ),
        )
            : BodyLargeText(
          text,
          color: textColor ?? colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

  Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}
