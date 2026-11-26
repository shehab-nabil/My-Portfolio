import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/hover_card.dart';

class CoursesCard extends StatelessWidget {
  const CoursesCard(this.content, {super.key});

  final SkillsContent content;

  @override
  Widget build(BuildContext context) => HoverCard(
    color: AppColors.accentSoft,
    borderColor: AppColors.accentSoft,
    hoverBorderColor: AppColors.accent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          content.coursesTitle.toUpperCase(),
          style: AppText.label(color: AppColors.onAccentSoft),
        ),
        for (final item in content.courses) ...[
          const SizedBox(height: 16),
          Text(
            item.label,
            style: AppText.heading(19, color: AppColors.onAccentSoft),
          ),
          const SizedBox(height: 4),
          Text(item.value, style: AppText.body(color: AppColors.onAccentSoft)),
        ],
      ],
    ),
  );
}
