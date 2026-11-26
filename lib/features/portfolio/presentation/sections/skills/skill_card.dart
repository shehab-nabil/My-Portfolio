import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/chip_wrap.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/hover_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tech_chip.dart';

class SkillCard extends StatelessWidget {
  const SkillCard(this.group, {super.key});

  final SkillGroup group;

  @override
  Widget build(BuildContext context) => HoverCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(group.title, style: AppText.heading(19)),
        const SizedBox(height: 16),
        ChipWrap(children: [for (final s in group.skills) TechChip(s)]),
      ],
    ),
  );
}
