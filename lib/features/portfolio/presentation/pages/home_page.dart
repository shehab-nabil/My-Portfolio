import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/section_id.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/scroll_flags.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/section_navigator.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/section_requests.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/smooth_scroll.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/navigation/routes.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/apps/apps_section.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/contact/contact_section.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/domains/domains_strip.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/experience/experience_section.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/hero/hero_section.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/skills/skills_section.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/stories/stories_section.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/top_bar/nav_drawer.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/top_bar/top_bar.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/page_shell.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/page_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ScrollController();
  late final _flags = ScrollFlags(_controller);
  late final _navigator = SectionNavigator(_controller);
  late final SectionRequests _requests;
  Timer? _pending;

  @override
  void initState() {
    super.initState();
    _requests = context.sectionRequests..addListener(_onRequest);
    // A request may have been made before this page was first built.
    _onRequest();
  }

  void _onRequest() {
    final id = _requests.take();
    if (id == null) return;
    // Let the route transition finish before scrolling.
    _pending?.cancel();
    _pending = Timer(const Duration(milliseconds: 300), () {
      if (mounted) _navigator.scrollTo(context, id);
    });
  }

  @override
  void dispose() {
    _requests.removeListener(_onRequest);
    _pending?.cancel();
    _flags.dispose();
    _navigator.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _scrollToTop() => _controller.smoothTo(context, 0);

  void _onLayoutChanged() {
    _flags.update();
    _navigator.invalidate();
  }

  /// Exhaustive: a new [SectionId] will not compile until it has a widget.
  Widget _section(SectionId id) {
    final portfolio = context.portfolio;
    return switch (id) {
      SectionId.apps => AppsSection(
        content: portfolio.apps,
        onOpenCaseStudy: () => context.go(Routes.novaCaseStudy),
      ),
      SectionId.stories => StoriesSection(portfolio.stories),
      SectionId.experience => ExperienceSection(portfolio.experience),
      SectionId.skills => SkillsSection(portfolio.skills),
      SectionId.contact => ContactSection(
        content: portfolio.contact,
        details: portfolio.contactDetails,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final portfolio = context.portfolio;
    final profile = portfolio.profile;
    _navigator.barHeight = Layout.barHeight(context);

    return PageTitle(
      title: '${profile.fullName} · ${profile.role}',
      child: Scaffold(
        endDrawer: Layout.isDesktop(context)
            ? null
            : NavDrawer(
                onSelect: (id) => _navigator.scrollTo(this.context, id),
              ),
        body: PageShell(
          controller: _controller,
          flags: _flags,
          onLayoutChanged: _onLayoutChanged,
          onBackToTop: _scrollToTop,
          topBar: TopBar(
            navigator: _navigator,
            flags: _flags,
            onBrandTap: _scrollToTop,
          ),
          children: [
            HeroSection(
              profile: profile,
              content: portfolio.hero,
              onSeeApps: () => _navigator.scrollTo(context, SectionId.apps),
              onGetInTouch: () =>
                  _navigator.scrollTo(context, SectionId.contact),
            ),
            DomainsStrip(portfolio.domains),
            for (final id in SectionId.values)
              KeyedSubtree(key: _navigator.keys[id], child: _section(id)),
          ],
        ),
      ),
    );
  }
}
