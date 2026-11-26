import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/content.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tappable.dart';

/// Small white "Google Play ↗" pill.
class StorePill extends StatelessWidget {
  const StorePill(this.link, {super.key});

  final LinkItem link;

  @override
  Widget build(BuildContext context) => SelectionContainer.disabled(
    child: Tappable(
      isLink: true,
      onTap: () => context.openLink(link.url),
      builder: (context, active) => AnimatedContainer(
        duration: Motion.of(context, Motion.hover),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: active ? AppColors.accent : AppColors.borderStrong,
          ),
        ),
        child: Text(
          '${link.label} ↗',
          style: AppText.body(
            size: 13,
            weight: FontWeight.w600,
            color: active ? AppColors.accent : AppColors.ink,
          ),
        ),
      ),
    ),
  );
}
