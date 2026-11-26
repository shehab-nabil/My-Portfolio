import 'package:flutter/material.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/experience/timeline_entry.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/reveal.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/section.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection(this.content, {super.key});

  final ExperienceContent content;

  @override
  Widget build(BuildContext context) => Section(
    band: true,
    heading: content.heading,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (i, job) in content.jobs.indexed)
          Reveal(
            delay: Duration(milliseconds: i * 70),
            child: TimelineEntry(job, last: i == content.jobs.length - 1),
          ),
      ],
    ),
  );
}
