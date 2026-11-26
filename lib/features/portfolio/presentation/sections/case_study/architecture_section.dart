import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/chip_wrap.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/hover_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/reveal.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/section.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tech_chip.dart';

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection(this.study, {super.key});

  final CaseStudy study;

  @override
  Widget build(BuildContext context) => Section(
    band: true,
    heading: study.architectureHeading,
    child: Column(
      children: [
        for (final (i, layer) in study.layers.indexed) ...[
          if (i > 0)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Icon(
                Icons.arrow_downward,
                size: 18,
                color: AppColors.muted,
              ),
            ),
          Reveal(
            delay: Duration(milliseconds: i * 70),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820),
              child: HoverCard(
                color: i == 0 ? AppColors.accentSoft : AppColors.background,
                radius: 16,
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      Text(layer.name, style: AppText.heading(18)),
                      ChipWrap(
                        children: [for (final x in layer.items) TechChip(x)],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    ),
  );
}
