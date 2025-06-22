import 'package:flutter/material.dart';
import 'package:ui/src/widgets/text/body_text.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double elevation;
  final Color? textColor;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.borderRadius = 25,
    this.elevation = 0,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        padding: padding,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(colorScheme.onPrimary),
              ),
            )
          : BodyLargeBoldText(
              text,
              color: textColor ?? colorScheme.onPrimary,
            ),
    );
  }
}

class AppPrimaryContainerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double elevation;
  final Color? textColor;

  const AppPrimaryContainerButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
    this.borderRadius = 25,
    this.elevation = 0,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        padding: padding,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor:
                    AlwaysStoppedAnimation(colorScheme.onPrimaryContainer),
              ),
            )
          : BodyLargeBoldText(
              text,
              color: textColor ?? colorScheme.onPrimaryContainer,
            ),
    );
  }
}
