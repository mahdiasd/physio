import 'package:flutter/material.dart';
import 'package:physio/app/theme/text_theme.dart';
import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
  ).copyWith(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,

    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.onSecondaryContainer,

    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiary,
    tertiaryContainer: AppColors.tertiaryContainer,
    onTertiaryContainer: AppColors.onTertiaryContainer,

    background: AppColors.background,
    onBackground: AppColors.onBackground,

    surface: AppColors.surface,
    onSurface: AppColors.onSurface,

    error: AppColors.error,
    onError: AppColors.onError,

    surfaceVariant: AppColors.surfaceContainer,
    onSurfaceVariant: AppColors.onSurfaceContainer,
    outline: AppColors.outline,
  ),
  useMaterial3: true,
  textTheme: appTextTheme,
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.darkPrimary,
    brightness: Brightness.dark,
  ).copyWith(
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    primaryContainer: AppColors.darkPrimaryContainer,
    onPrimaryContainer: AppColors.darkOnPrimaryContainer,

    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkOnSecondary,
    secondaryContainer: AppColors.darkSecondaryContainer,
    onSecondaryContainer: AppColors.darkOnSecondaryContainer,

    tertiary: AppColors.darkTertiary,
    onTertiary: AppColors.darkOnTertiary,
    tertiaryContainer: AppColors.darkTertiaryContainer,
    onTertiaryContainer: AppColors.darkOnTertiaryContainer,

    background: AppColors.darkBackground,
    onBackground: AppColors.darkOnBackground,

    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,

    error: AppColors.darkError,
    onError: AppColors.darkOnError,

    surfaceVariant: AppColors.darkSurfaceContainer,
    onSurfaceVariant: AppColors.darkOnSurfaceContainer,
    outline: AppColors.darkOutline,
  ),
  useMaterial3: true,
  textTheme: appTextTheme,

);
