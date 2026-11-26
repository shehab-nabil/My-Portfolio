import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';

class HeroStat extends StatelessWidget {
  const HeroStat(this.stat, {super.key});

  final Fact stat;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(top: 14),
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(color: AppColors.borderStrong)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(stat.value, style: AppText.heading(28)),
        ),
        const SizedBox(height: 4),
        Text(
          stat.label,
          style: AppText.body(size: 13, color: AppColors.muted, height: 1.4),
        ),
      ],
    ),
  );
}
