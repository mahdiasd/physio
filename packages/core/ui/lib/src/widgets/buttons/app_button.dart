import 'package:flutter/material.dart';
import 'package:ui/src/widgets/text/body_text.dart';

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
            return _darken(colorScheme.primary, 0.1); // Hover state
          }
          return colorScheme.primary; // Default
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return const Color(0xFF9FB7B2); // Disabled text
          }
          return textColor ?? colorScheme.onPrimary;
        }),
        padding: WidgetStateProperty.all(
          padding ?? const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        ),
        elevation: WidgetStateProperty.all(elevation ?? 0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000), // Full radius
          ),
        ),
        shadowColor: WidgetStateProperty.all(
          Colors.black.withValues(alpha: 0.1),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor:
                    AlwaysStoppedAnimation(textColor ?? colorScheme.onPrimary),
              ),
            )
          : BodyLargeBoldText(
              text,
              color: colorScheme.onPrimary,
            ),
    );
  }

  /// Helper function to darken a color
  Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final darkened =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
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
        padding: WidgetStateProperty.all(
          padding ?? const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        ),
        elevation: WidgetStateProperty.all(elevation ?? 0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
        shadowColor: WidgetStateProperty.all(
          Colors.black.withValues(alpha: 0.1),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(
                  textColor ?? colorScheme.onPrimaryContainer,
                ),
              ),
            )
          : BodyMediumBoldText(
              text,
              color: colorScheme.onPrimary,
            ),
    );
  }

  Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final darkened =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkened.toColor();
  }
}
