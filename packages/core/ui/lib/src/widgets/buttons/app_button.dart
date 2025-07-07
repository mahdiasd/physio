import 'package:flutter/material.dart';
import 'package:ui/src/widgets/text/body_text.dart';
import 'package:ui/src/widgets/text/label_text.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? textColor;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.padding,
    this.elevation,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = onPressed == null || isLoading;

    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return const Color(0xFFD0E8E3); // Disabled background
          }
          if (states.contains(WidgetState.hovered)) {
            return _darken(theme.colorScheme.primary, 0.1); // Hover darker
          }
          return theme.colorScheme.primary; // Default
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return const Color(0xFF9FB7B2); // Disabled text
          }
          return textColor ?? theme.colorScheme.onPrimary;
        }),
        padding: WidgetStateProperty.all(
          padding ?? const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        ),
        elevation: WidgetStateProperty.all(elevation ?? 4),
        shadowColor: WidgetStateProperty.all(
          Colors.black.withAlpha((0.1 * 255).round()), // 10% black shadow
        ),
        textStyle: WidgetStateProperty.all(theme.textTheme.labelLarge),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000), // Full radius
          ),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(textColor ?? theme.colorScheme.onPrimary),
              ),
            )
          : LabelLargeText(
              text,
              color: textColor ?? theme.colorScheme.onPrimary,
            ),
    );
  }

  Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final darkened = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkened.toColor();
  }
}

class AppPrimaryContainerButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? textColor;

  const AppPrimaryContainerButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.padding,
    this.elevation,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDisabled = onPressed == null || isLoading;

    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return const Color(0xFFD0E8E3); // Disabled background
          }
          if (states.contains(WidgetState.hovered)) {
            return _darken(colorScheme.primaryContainer, 0.05); // Hover
          }
          return colorScheme.primaryContainer; // Default
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return const Color(0xFF9FB7B2); // Disabled text
          }
          return textColor ?? colorScheme.onPrimaryContainer;
        }),
        padding: WidgetStateProperty.all(
          padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
        elevation: WidgetStateProperty.all(elevation ?? 4),
        shadowColor: WidgetStateProperty.all(
          Colors.black.withAlpha((0.1 * 255).round()), // Shadow same as primary
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(textColor ?? colorScheme.onPrimaryContainer),
              ),
            )
          : BodyLargeText(
              text,
              color: textColor ?? colorScheme.onPrimaryContainer,
            ),
    );
  }

  Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final darkened = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkened.toColor();
  }
}
