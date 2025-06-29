import 'package:flutter/material.dart';

import '../../ui.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme(
      brightness: Brightness.light,

      // ✅ Primary Colors
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,

      // ✅ Secondary Colors
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.onSecondaryContainer,

      // ✅ Tertiary Colors
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      tertiaryContainer: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.onTertiaryContainer,

      // ✅ Surface & On Surface
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      surfaceContainerLowest: AppColors.surfaceContainer,
      surfaceContainerLow: AppColors.surfaceContainerLow,
      surfaceContainer: AppColors.surfaceContainer,
      surfaceContainerHigh: AppColors.surfaceContainerHigh,
      surfaceContainerHighest: AppColors.surfaceContainerHigh,
      onSurfaceVariant: AppColors.onSurfaceContainer,

      // ✅ Error Colors
      error: AppColors.error,
      onError: AppColors.onError,

      // ✅ Outline
      outline: AppColors.outline,

      scrim: AppColors.placeholder),
  useMaterial3: true,
  textTheme: appTextTheme,
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme(
      brightness: Brightness.dark,

      // ✅ Primary Colors
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkOnPrimary,
      primaryContainer: AppColors.darkPrimaryContainer,
      onPrimaryContainer: AppColors.darkOnPrimaryContainer,

      // ✅ Secondary Colors
      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.darkOnSecondary,
      secondaryContainer: AppColors.darkSecondaryContainer,
      onSecondaryContainer: AppColors.darkOnSecondaryContainer,

      // ✅ Tertiary Colors
      tertiary: AppColors.darkTertiary,
      onTertiary: AppColors.darkOnTertiary,
      tertiaryContainer: AppColors.darkTertiaryContainer,
      onTertiaryContainer: AppColors.darkOnTertiaryContainer,

      // ✅ Surface & On Surface
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkOnSurface,
      surfaceContainerLowest: AppColors.darkSurfaceContainer,
      surfaceContainerLow: AppColors.darkSurfaceContainerLow,
      surfaceContainer: AppColors.darkSurfaceContainer,
      surfaceContainerHigh: AppColors.darkSurfaceContainerHigh,
      surfaceContainerHighest: AppColors.darkSurfaceContainerHigh,
      onSurfaceVariant: AppColors.darkOnSurfaceContainer,

      // ✅ Error Colors
      error: AppColors.darkError,
      onError: AppColors.darkOnError,

      // ✅ Outline
      outline: AppColors.darkOutline,
      scrim: AppColors.darkPlaceholder),
  useMaterial3: true,
  textTheme: appTextTheme,
);
