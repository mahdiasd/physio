import 'package:flutter/material.dart';

import '../../ui.dart';
import 'app_radius.dart';

extension ThemeDataExtension on ThemeData {
  AppRadius get radius => AppRadius();
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  CustomColors get customColors => theme.customColors;
}

@immutable
class CustomColors {
  final Color success;
  final Color onSuccess;
  final Color disabled;
  final Color placeholder;
  final Color helper;
  final Color subtext;
  final Color leftSectionSurface;
  final Color onLeftSectionSurface;

  const CustomColors({
    required this.success,
    required this.onSuccess,
    required this.disabled,
    required this.placeholder,
    required this.subtext,
    required this.helper,
    required this.leftSectionSurface,
    required this.onLeftSectionSurface,
  });

  // Light theme colors
  factory CustomColors.light() {
    return const CustomColors(
      success: AppColors.success,
      onSuccess: AppColors.onSuccess,
      disabled: AppColors.disabled,
      placeholder: AppColors.placeholder,
      helper: AppColors.helper,
      subtext: AppColors.subtext,
      leftSectionSurface: AppColors.leftSectionSurface,
      onLeftSectionSurface: AppColors.onLeftSectionSurface,
    );
  }

  // Dark theme colors
  factory CustomColors.dark() {
    return const CustomColors(
      success: AppColors.darkSuccess,
      onSuccess: AppColors.darkOnSuccess,
      disabled: AppColors.darkDisabled,
      placeholder: AppColors.darkPlaceholder,
      helper: AppColors.helper,
      subtext: AppColors.darkSubtext,
      leftSectionSurface: AppColors.leftSectionSurface,
      onLeftSectionSurface: AppColors.onLeftSectionSurface,
    );
  }
}
