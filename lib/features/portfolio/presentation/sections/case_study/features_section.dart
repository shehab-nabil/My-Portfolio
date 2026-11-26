import 'package:flutter/material.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/case_study/block_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/responsive_grid.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/section.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection(this.study, {super.key});

  final CaseStudy study;

  @override
  Widget build(BuildContext context) => Section(
    heading: study.featuresHeading,
    child: ResponsiveGrid(
      minItemWidth: 300,
      children: [for (final f in study.features) BlockCard(f)],
    ),
  );
}
