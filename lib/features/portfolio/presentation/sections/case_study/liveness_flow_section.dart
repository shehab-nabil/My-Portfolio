import 'package:flutter/material.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/case_study/block_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/responsive_grid.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/section.dart';

class LivenessFlowSection extends StatelessWidget {
  const LivenessFlowSection(this.study, {super.key});

  final CaseStudy study;

  @override
  Widget build(BuildContext context) => Section(
    heading: study.flowHeading,
    child: ResponsiveGrid(
      minItemWidth: 250,
      maxColumns: 4,
      children: [
        for (final (i, step) in study.flowSteps.indexed)
          BlockCard(step, number: i + 1),
      ],
    ),
  );
}
