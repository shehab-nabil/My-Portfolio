import 'package:flutter/material.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/case_study/block_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/responsive_grid.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/section.dart';

class ResultsSection extends StatelessWidget {
  const ResultsSection(this.study, {super.key});

  final CaseStudy study;

  @override
  Widget build(BuildContext context) => Section(
    child: ResponsiveGrid(
      minItemWidth: 320,
      maxColumns: 2,
      children: [
        BlockCard(study.delivery),
        BlockCard(study.outcome, soft: true),
      ],
    ),
  );
}
