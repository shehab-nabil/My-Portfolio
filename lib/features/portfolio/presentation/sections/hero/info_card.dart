import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/hover_card.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(this.block, {super.key, this.soft = false});

  final TextBlock block;
  final bool soft;

  @override
  Widget build(BuildContext context) => HoverCard(
    padding: const EdgeInsets.all(18),
    color: soft ? AppColors.accentSoft : AppColors.surface,
    borderColor: soft ? AppColors.accentSoft : AppColors.border,
    hoverBorderColor: soft ? AppColors.accent : AppColors.borderStrong,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          block.title.toUpperCase(),
          style: AppText.label(
            color: soft ? AppColors.onAccentSoft : AppColors.muted,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          block.body,
          style: AppText.body(
            size: 15,
            weight: FontWeight.w600,
            color: soft ? AppColors.onAccentSoft : AppColors.ink,
            height: 1.4,
          ),
        ),
      ],
    ),
  );
}
