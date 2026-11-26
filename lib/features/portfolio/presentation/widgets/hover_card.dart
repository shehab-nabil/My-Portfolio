import 'package:flutter/material.dart';

import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/hover_builder.dart';

/// A card that rises 4px and darkens its border on hover.
class HoverCard extends StatelessWidget {
  const HoverCard({
    super.key,
    required this.child,
    this.color = AppColors.surface,
    this.borderColor = AppColors.border,
    this.hoverBorderColor = AppColors.borderStrong,
    this.borderWidth = 1,
    this.radius = 20,
    this.padding = const EdgeInsets.all(24),
  });

  final Widget child;
  final Color color;
  final Color borderColor;
  final Color hoverBorderColor;
  final double borderWidth;
  final double radius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => HoverBuilder(
    // The MouseRegion sits outside the transform, so the card can't flicker
    // when it moves out from under the pointer.
    builder: (context, hovered) => AnimatedContainer(
      duration: Motion.of(context, Motion.hover),
      curve: Curves.easeOut,
      transform: Matrix4.translationValues(
        0,
        hovered && !Motion.reduced(context) ? -4 : 0,
        0,
      ),
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: hovered ? hoverBorderColor : borderColor,
          width: borderWidth,
        ),
      ),
      child: child,
    ),
  );
}
