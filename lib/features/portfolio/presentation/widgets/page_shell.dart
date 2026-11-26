import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/scroll_flags.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/back_to_top.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/keyboard_scroll_focus.dart';

/// The frame every page shares: a selectable scrolling column under a sticky
/// bar, with a back-to-top button.
class PageShell extends StatelessWidget {
  const PageShell({
    super.key,
    required this.controller,
    required this.flags,
    required this.topBar,
    required this.onBackToTop,
    required this.children,
    this.onLayoutChanged,
  });

  final ScrollController controller;
  final ScrollFlags flags;
  final Widget topBar;
  final VoidCallback onBackToTop;
  final List<Widget> children;

  /// Called when the content or window size changes.
  final VoidCallback? onLayoutChanged;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Positioned.fill(
        child: NotificationListener<ScrollMetricsNotification>(
          onNotification: (notification) {
            if (notification.metrics.axis == Axis.vertical) {
              onLayoutChanged?.call();
            }
            return false;
          },
          child: SelectionArea(
            // Not a lazy list: every section must exist to be jumped to.
            child: SingleChildScrollView(
              controller: controller,
              child: KeyboardScrollFocus(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: Layout.barHeight(context)),
                    ...children,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(top: 0, left: 0, right: 0, child: topBar),
      Positioned(
        right: 20,
        bottom: 20,
        child: BackToTop(
          visible: flags.pastFirstScreen,
          label: context.portfolio.navigation.backToTop,
          onTap: onBackToTop,
        ),
      ),
    ],
  );
}
