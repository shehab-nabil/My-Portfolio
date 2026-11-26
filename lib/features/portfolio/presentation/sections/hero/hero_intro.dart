import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/hero/hero_entrance.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/hero/hero_identity.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/hero/hero_stat.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/pill_button.dart';

/// Left column: identity, headline, summary, calls to action and stats.
class HeroIntro extends StatelessWidget {
  const HeroIntro({
    super.key,
    required this.profile,
    required this.content,
    required this.onSeeApps,
    required this.onGetInTouch,
  });

  final Profile profile;
  final HeroContent content;
  final VoidCallback onSeeApps;
  final VoidCallback onGetInTouch;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      HeroEntrance(step: 0, child: HeroIdentity(profile)),
      const SizedBox(height: 28),
      HeroEntrance(
        step: 1,
        child: Semantics(
          header: true,
          child: Text(
            content.headline,
            style: AppText.heading(Layout.fluid(context, 40, 68, 0.047)),
          ),
        ),
      ),
      const SizedBox(height: 20),
      HeroEntrance(
        step: 2,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(content.summary, style: AppText.body(size: 17)),
        ),
      ),
      const SizedBox(height: 28),
      HeroEntrance(
        step: 3,
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            PillButton(label: content.seeApps, onTap: onSeeApps),
            PillButton(
              label: content.getInTouch,
              style: PillStyle.ghost,
              onTap: onGetInTouch,
            ),
          ],
        ),
      ),
      const SizedBox(height: 40),
      HeroEntrance(
        step: 4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final (i, stat) in content.stats.indexed) ...[
              if (i > 0) const SizedBox(width: 16),
              Expanded(child: HeroStat(stat)),
            ],
          ],
        ),
      ),
    ],
  );
}
