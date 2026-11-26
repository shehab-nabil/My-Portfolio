import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tappable.dart';

/// Plain text link with a colour change on hover.
class TextLink extends StatelessWidget {
  const TextLink({
    super.key,
    required this.label,
    required this.onTap,
    this.color = AppColors.accent,
    this.hoverColor = AppColors.accentHover,
    this.size = 15,
  });

  final String label;
  final VoidCallback onTap;
  final Color color;
  final Color hoverColor;
  final double size;

  @override
  Widget build(BuildContext context) => SelectionContainer.disabled(
    child: Tappable(
      isLink: true,
      onTap: onTap,
      builder: (context, active) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: AnimatedDefaultTextStyle(
          duration: Motion.of(context, Motion.hover),
          style: AppText.body(
            size: size,
            weight: FontWeight.w600,
            color: active ? hoverColor : color,
          ),
          child: Text(label),
        ),
      ),
    ),
  );
}
