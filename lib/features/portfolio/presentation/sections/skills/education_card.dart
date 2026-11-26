import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/bullet.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/hover_card.dart';

class EducationCard extends StatelessWidget {
  const EducationCard(this.content, {super.key});

  final SkillsContent content;

  @override
  Widget build(BuildContext context) => HoverCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(content.educationTitle.toUpperCase(), style: AppText.label()),
        const SizedBox(height: 14),
        Text(content.degree, style: AppText.heading(19)),
        const SizedBox(height: 6),
        Text(content.university, style: AppText.mono()),
        const SizedBox(height: 14),
        for (final note in content.educationNotes) Bullet(note),
      ],
    ),
  );
}
