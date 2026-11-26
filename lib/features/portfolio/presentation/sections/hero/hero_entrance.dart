import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/core/utils/motion.dart';

/// Page-load fade and 16px rise. [step] sets the order, 80ms apart.
class HeroEntrance extends StatelessWidget {
  const HeroEntrance({super.key, required this.step, required this.child});

  final int step;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (Motion.reduced(context)) return child;
    return child
        .animate(delay: (80 * step).ms)
        .fadeIn(duration: Motion.reveal, curve: Motion.revealCurve)
        .moveY(
          begin: 16,
          end: 0,
          duration: Motion.reveal,
          curve: Motion.revealCurve,
        );
  }
}
