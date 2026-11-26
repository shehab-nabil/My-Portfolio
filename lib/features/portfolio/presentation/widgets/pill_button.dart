import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tappable.dart';

enum PillStyle { primary, ghost, light, ghostDark }

/// 48px fully rounded button.
class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.label,
    required this.onTap,
    this.style = PillStyle.primary,
    this.height = 48,
  });

  final String label;
  final VoidCallback onTap;
  final PillStyle style;
  final double height;

  ({Color fill, Color text, Color border}) _colors(bool active) =>
      switch (style) {
        PillStyle.primary => (
          fill: active ? AppColors.accent : AppColors.ink,
          text: Colors.white,
          border: active ? AppColors.accent : AppColors.ink,
        ),
        PillStyle.ghost => (
          fill: Colors.transparent,
          text: active ? AppColors.accent : AppColors.ink,
          border: active ? AppColors.accent : AppColors.borderStrong,
        ),
        PillStyle.light => (
          fill: active ? AppColors.accentSoft : AppColors.onDark,
          text: active ? AppColors.accentHover : AppColors.ink,
          border: active ? AppColors.accentSoft : AppColors.onDark,
        ),
        PillStyle.ghostDark => (
          fill: Colors.transparent,
          text: active ? AppColors.accentOnDark : AppColors.onDark,
          border: active
              ? AppColors.accentOnDark
              : AppColors.onDark.withValues(alpha: 0.3),
        ),
      };

  @override
  Widget build(BuildContext context) => SelectionContainer.disabled(
    child: Tappable(
      onTap: onTap,
      builder: (context, active) {
        final colors = _colors(active);
        return AnimatedContainer(
          duration: Motion.of(context, Motion.hover),
          height: height,
          padding: EdgeInsets.symmetric(horizontal: height * 0.46),
          decoration: BoxDecoration(
            color: colors.fill,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: colors.border),
          ),
          child: Center(
            widthFactor: 1,
            child: Text(
              label,
              maxLines: 1,
              style: AppText.body(
                size: 15,
                weight: FontWeight.w600,
                color: colors.text,
              ),
            ),
          ),
        );
      },
    ),
  );
}
