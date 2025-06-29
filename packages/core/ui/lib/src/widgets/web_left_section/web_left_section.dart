import 'package:flutter/material.dart';
import 'package:ui/ui.dart'; // Assuming DisplayLargeText and HeadlineMediumText are defined here

class WebLeftSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const WebLeftSection({
    super.key,
    this.title = "Rose Physio HUB",
    this.subtitle =
        "Your personal space to follow your care plan, track your progress, and stay connected with your practitioner.",
    this.imagePath = "assets/images/login_vector.png", // Default image path
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: AppColors.leftSectionSurface,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Column(
            spacing: 16,
            children: [
              DisplayLargeText(
                title,
                textAlign: TextAlign.center,
                color: theme.colorScheme.primary,
              ),
              HeadlineSmallText(
                subtitle,
                textAlign: TextAlign.center,
                color: AppColors.onLeftSectionSurface,
              ),
            ],
          ),
          const SizedBox(height: 0),
          Expanded( // Added Expanded to prevent overflow
            child: LayoutBuilder(
              builder: (context, constraints) {
                final imageMaxWidth = constraints.maxWidth - (2 * 24); // 24 padding on each side
                final imageMaxHeight = constraints.maxHeight; // Consider available height
                final imageSize = imageMaxWidth < imageMaxHeight ? imageMaxWidth : imageMaxHeight; // Maintain aspect ratio
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: imageSize,
                    maxHeight: imageSize,
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    width: imageSize,
                    height: imageSize,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
