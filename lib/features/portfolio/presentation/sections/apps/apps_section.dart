import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/apps/add_project_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/apps/featured_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/apps/project_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/responsive_grid.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/reveal.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/section.dart';

class AppsSection extends StatelessWidget {
  const AppsSection({
    super.key,
    required this.content,
    required this.onOpenCaseStudy,
  });

  final AppsContent content;
  final VoidCallback onOpenCaseStudy;

  @override
  Widget build(BuildContext context) => Section(
    heading: content.heading,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Reveal(
          child: FeaturedCard(
            content: content,
            onOpenCaseStudy: onOpenCaseStudy,
          ),
        ),
        const SizedBox(height: Layout.gap),
        ResponsiveGrid(
          minItemWidth: 360,
          children: [
            for (final project in content.projects) ProjectCard(project),
            for (var i = 0; i < content.emptyProjectSlots; i++)
              AddProjectCard(
                title: content.addProjectTitle,
                body: content.addProjectBody,
              ),
          ],
        ),
      ],
    ),
  );
}
