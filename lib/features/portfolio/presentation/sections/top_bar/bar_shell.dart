import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/page_container.dart';

/// Translucent sticky bar. Blur and shadow fade in once [scrolled] is true.
class BarShell extends StatelessWidget {
  const BarShell({super.key, required this.scrolled, required this.child});

  final ValueNotifier<bool> scrolled;
  final Widget child;

  @override
  Widget build(BuildContext context) => SelectionContainer.disabled(
    child: ValueListenableBuilder<bool>(
      valueListenable: scrolled,
      builder: (context, isScrolled, child) => TweenAnimationBuilder<double>(
        tween: Tween(end: isScrolled ? 1 : 0),
        duration: Motion.of(context, Motion.underline),
        builder: (context, t, child) => DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.ink.withValues(alpha: 0.07 * t),
                blurRadius: 18,
                offset: const Offset(0, 4),
                // Keep the shadow outside so it doesn't tint the glass.
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: ClipRect(
            child: BackdropFilter(
              enabled: t > 0,
              filter: ImageFilter.blur(sigmaX: 12 * t, sigmaY: 12 * t),
              child: child,
            ),
          ),
        ),
        child: child,
      ),
      child: Container(
        height: Layout.barHeight(context),
        decoration: BoxDecoration(
          color: AppColors.background.withValues(alpha: 0.85),
          border: const Border(bottom: BorderSide(color: AppColors.border)),
        ),
        child: PageContainer(
          child: SizedBox(height: Layout.barHeight(context), child: child),
        ),
      ),
    ),
  );
}
