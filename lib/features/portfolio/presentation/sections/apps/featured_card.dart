import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/apps/app_header.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/accent_badge.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/bullet.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/chip_wrap.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/hover_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/pill_button.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/screenshot_band.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/store_pill.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tech_chip.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({
    super.key,
    required this.content,
    required this.onOpenCaseStudy,
  });

  final AppsContent content;
  final VoidCallback onOpenCaseStudy;

  @override
  Widget build(BuildContext context) {
    final project = content.featured;
    final wide = Layout.width(context) >= 900;
    final padding = Layout.isMobile(context) ? 20.0 : 32.0;

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          content.featuredLabel.toUpperCase(),
          style: AppText.label(color: AppColors.accent),
        ),
        const SizedBox(height: 16),
        AppHeader(project, titleSize: 28),
        const SizedBox(height: 18),
        Text(project.description, style: AppText.body()),
        const SizedBox(height: 16),
        ChipWrap(children: [for (final b in project.badges) AccentBadge(b)]),
        const SizedBox(height: 18),
        for (final bullet in project.bullets) Bullet(bullet),
        const SizedBox(height: 10),
        ChipWrap(children: [for (final t in project.tech) TechChip(t)]),
        const SizedBox(height: 22),
        Wrap(
          spacing: 10,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            PillButton(label: content.readCaseStudy, onTap: onOpenCaseStudy),
            for (final link in project.links) StorePill(link),
          ],
        ),
      ],
    );
    final shots = ScreenshotBand(project: project);

    return HoverCard(
      radius: 24,
      borderWidth: 1.5,
      borderColor: AppColors.accent,
      hoverBorderColor: AppColors.accentHover,
      padding: EdgeInsets.all(padding),
      child: wide
          ? Row(
              children: [
                Expanded(child: text),
                const SizedBox(width: 32),
                Expanded(child: shots),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [text, const SizedBox(height: 24), shots],
            ),
    );
  }
}
