import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';

class AppStyles {
  // Title Styles
  static const TextStyle pageTitle = TextStyle(
    fontSize: AppDimensions.fontMassive,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle sheetTitle = TextStyle(
    fontSize: AppDimensions.fontXXLarge,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: AppDimensions.fontXLarge,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // Body Text Styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: AppDimensions.fontLarge,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: AppDimensions.fontMedium,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: AppDimensions.fontSmall,
    color: AppColors.textLight,
  );

  // Number Styles
  static const TextStyle numberHuge = TextStyle(
    fontSize: AppDimensions.fontLarge,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Button Styles
  static const TextStyle buttonText = TextStyle(
    fontSize: AppDimensions.fontLarge,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Percentage Badge Style
  static const TextStyle percentageBadge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.percentageText,
  );

  // Chip Style
  static const TextStyle chipText = TextStyle(
    fontSize: AppDimensions.fontMedium,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
}
