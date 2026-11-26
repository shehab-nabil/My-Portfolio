import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/hero/hero_entrance.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/hero/info_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/code_card.dart';

/// Right column: the code card and the two small cards under it.
class HeroAside extends StatelessWidget {
  const HeroAside(this.content, {super.key});

  final HeroContent content;

  @override
  Widget build(BuildContext context) {
    Widget code = CodeCard(fileName: content.codeFileName, code: content.code);
    if (!Motion.reduced(context)) {
      code = code
          .animate(delay: 160.ms)
          .fadeIn(duration: 600.ms, curve: Motion.revealCurve)
          .scaleXY(
            begin: 0.97,
            end: 1,
            duration: 600.ms,
            curve: Motion.revealCurve,
          );
    }
    final cards = [
      InfoCard(content.currently),
      InfoCard(content.highlight, soft: true),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RepaintBoundary(child: code),
        const SizedBox(height: 16),
        HeroEntrance(
          step: 5,
          child: Layout.width(context) < 460
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [cards[0], const SizedBox(height: 16), cards[1]],
                )
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: cards[0]),
                      const SizedBox(width: 16),
                      Expanded(child: cards[1]),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
