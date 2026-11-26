import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/presentation/navigation/routes.dart';
import 'package:my_portfolio/features/portfolio/presentation/pages/case_study_page.dart';
import 'package:my_portfolio/features/portfolio/presentation/pages/home_page.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/defer_until_shown.dart';

GoRouter buildRouter() => GoRouter(
  routes: [
    // The case study is nested so the home page stays mounted underneath:
    // going back restores the scroll position without replaying animations.
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) =>
          _fade(context, state, const DeferUntilShown(child: HomePage())),
      routes: [
        GoRoute(
          path: Routes.novaCaseStudySegment,
          pageBuilder: (context, state) =>
              _fade(context, state, const CaseStudyPage()),
        ),
      ],
    ),
  ],
  onException: (context, state, router) => router.go(Routes.home),
);

Page<void> _fade(BuildContext context, GoRouterState state, Widget child) {
  final duration = Motion.of(context, const Duration(milliseconds: 250));
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, _, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
