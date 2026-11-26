import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/apps/app_header.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/accent_badge.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/bullet.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/chip_wrap.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/hover_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/screenshot.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/store_pill.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tech_chip.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard(this.project, {super.key});

  final Project project;

  static const _shotWidth = 100.0;

  @override
  Widget build(BuildContext context) => HoverCard(
    padding: EdgeInsets.all(Layout.isMobile(context) ? 20 : 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppHeader(project),
        const SizedBox(height: 16),
        ChipWrap(children: [for (final b in project.badges) AccentBadge(b)]),
        const SizedBox(height: 16),
        SizedBox(
          height: _shotWidth * Screenshot.aspect + 8,
          child: ScrollConfiguration(
            // Lets mouse users drag the strip when it overflows.
            behavior: ScrollConfiguration.of(context)
                .copyWith(dragDevices: PointerDeviceKind.values.toSet()),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  for (var i = 1; i <= 3; i++) ...[
                    if (i > 1) const SizedBox(width: 12),
                    Screenshot(project: project, index: i, width: _shotWidth),
                  ],
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        for (final bullet in project.bullets) Bullet(bullet),
        const SizedBox(height: 8),
        ChipWrap(children: [for (final t in project.tech) TechChip(t)]),
        const SizedBox(height: 20),
        const Spacer(),
        ChipWrap(children: [for (final l in project.links) StorePill(l)]),
      ],
    ),
  );
}
