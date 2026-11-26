import 'package:flutter/material.dart';

import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';

ThemeData buildAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.accent,
      surface: AppColors.surface,
    ),
    scaffoldBackgroundColor: AppColors.background,
    splashFactory: NoSplash.splashFactory,
  );
  return base.copyWith(
    textTheme: base.textTheme.apply(
      fontFamily: AppText.body().fontFamily,
      bodyColor: AppColors.body,
      displayColor: AppColors.ink,
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColors.accent.withValues(alpha: 0.25),
    ),
  );
}
