import 'package:flutter/material.dart';
import 'package:ui/ui.dart'; // Assuming DisplayLargeText and HeadlineMediumText are defined here

class WebLeftSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final double spacing;

  const WebLeftSection({
    super.key,
    this.title = "Rose Physio HUB",
    this.spacing = 0.0,
    this.subtitle = "Your personal space to follow your care plan,\ntrack your progress, and stay connected with your practitioner.",
    this.imagePath = "assets/images/login_vector.png", // Default image path
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Container(
        color: AppColors.leftSectionSurface,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: spacing,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 16,
                  children: [
                    PageHeaderText(
                      title,
                      textAlign: TextAlign.center,
                      color: theme.colorScheme.primary,
                    ),
                    PageSubTitleText(
                      subtitle,
                      textAlign: TextAlign.center,
                      color: AppColors.onLeftSectionSurface,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
