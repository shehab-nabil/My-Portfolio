import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/hover_card.dart';

class BlockCard extends StatelessWidget {
  const BlockCard(this.block, {super.key, this.number, this.soft = false});

  final TextBlock block;
  final int? number;
  final bool soft;

  @override
  Widget build(BuildContext context) => HoverCard(
    color: soft ? AppColors.accentSoft : AppColors.surface,
    borderColor: soft ? AppColors.accentSoft : AppColors.border,
    hoverBorderColor: soft ? AppColors.accent : AppColors.borderStrong,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (number != null) ...[
          Text(
            '$number'.padLeft(2, '0'),
            style: AppText.heading(32, color: AppColors.accent),
          ),
          const SizedBox(height: 12),
        ],
        Text(block.title, style: AppText.heading(19)),
        const SizedBox(height: 10),
        Text(block.body, style: AppText.body(size: 15)),
      ],
    ),
  );
}
