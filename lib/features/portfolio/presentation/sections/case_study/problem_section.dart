import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/reveal.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/section.dart';

class ProblemSection extends StatelessWidget {
  const ProblemSection(this.study, {super.key});

  final CaseStudy study;

  @override
  Widget build(BuildContext context) => Section(
    band: true,
    heading: study.problemHeading,
    child: Reveal(
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Text(study.problemBody, style: AppText.body(size: 18)),
        ),
      ),
    ),
  );
}
