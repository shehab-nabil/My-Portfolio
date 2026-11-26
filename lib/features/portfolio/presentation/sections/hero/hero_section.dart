import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/hero/hero_aside.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/hero/hero_intro.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/page_container.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
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

  /// Two columns need this much width; below it they stack.
  static const _twoColumnMin = 900.0;

  @override
  Widget build(BuildContext context) {
    final wide = Layout.width(context) >= _twoColumnMin;
    final intro = HeroIntro(
      profile: profile,
      content: content,
      onSeeApps: onSeeApps,
      onGetInTouch: onGetInTouch,
    );
    final aside = HeroAside(content);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Layout.isMobile(context) ? 40 : 80,
      ),
      child: PageContainer(
        child: wide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 11, child: intro),
                  const SizedBox(width: 56),
                  Expanded(flex: 9, child: aside),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [intro, const SizedBox(height: 40), aside],
              ),
      ),
    );
  }
}
