import 'package:flutter/material.dart';
import 'package:ui/src/widgets/buttons/app_button.dart';
import 'package:ui/src/widgets/text/body_text.dart';
import 'package:ui/src/widgets/text/other_texts.dart';
import 'package:ui/src/widgets/text/title_text.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final Color? containerColor;

  const AppDialog({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
    this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: containerColor ?? Theme.of(context).colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleMediumText(
              title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            BodyLargeText(
              description,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            AppPrimaryButton(text: buttonText, onPressed: onButtonPressed),
          ],
        ),
      ),
    );
  }
}
