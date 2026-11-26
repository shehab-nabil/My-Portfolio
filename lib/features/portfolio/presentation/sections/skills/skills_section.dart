import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/skills/courses_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/skills/education_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/skills/skill_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/responsive_grid.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection(this.content, {super.key});

  final SkillsContent content;

  @override
  Widget build(BuildContext context) => Section(
    heading: content.heading,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ResponsiveGrid(
          minItemWidth: 320,
          children: [for (final group in content.groups) SkillCard(group)],
        ),
        const SizedBox(height: Layout.gap),
        ResponsiveGrid(
          minItemWidth: 320,
          maxColumns: 2,
          children: [EducationCard(content), CoursesCard(content)],
        ),
      ],
    ),
  );
}
