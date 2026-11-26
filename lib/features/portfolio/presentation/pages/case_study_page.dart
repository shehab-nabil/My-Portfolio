import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/section_id.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/scroll_flags.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/smooth_scroll.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/navigation/routes.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/case_study/architecture_section.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/case_study/case_hero.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/case_study/features_section.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/case_study/liveness_flow_section.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/case_study/next_project.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/case_study/problem_section.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/case_study/results_section.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/top_bar/bar_shell.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/top_bar/brand.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/page_shell.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/page_title.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/reveal.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/screenshot_band.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/section.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/text_link.dart';

class CaseStudyPage extends StatefulWidget {
  const CaseStudyPage({super.key});

  @override
  State<CaseStudyPage> createState() => _CaseStudyPageState();
}

class _CaseStudyPageState extends State<CaseStudyPage> {
  final _controller = ScrollController();
  late final _flags = ScrollFlags(_controller);

  @override
  void dispose() {
    _flags.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _goHome() => context.go(Routes.home);

  void _goToApps() {
    context.sectionRequests.request(SectionId.apps);
    _goHome();
  }

  @override
  Widget build(BuildContext context) {
    final study = context.portfolio.caseStudy;

    return PageTitle(
      title: '${study.title} · ${study.label}',
      child: Scaffold(
        body: PageShell(
          controller: _controller,
          flags: _flags,
          onBackToTop: () => _controller.smoothTo(context, 0),
          topBar: BarShell(
            scrolled: _flags.scrolled,
            child: Row(
              children: [
                Brand(onTap: _goHome),
                const Spacer(),
                TextLink(
                  label: Layout.isMobile(context)
                      ? '← ${study.backShort}'
                      : '← ${study.back}',
                  onTap: _goHome,
                  color: AppColors.ink,
                  hoverColor: AppColors.accent,
                  size: 14,
                ),
              ],
            ),
          ),
          children: [
            CaseHero(study: study, onBack: _goHome),
            Section(
              child: Reveal(
                child: ScreenshotBand(
                  project: study.project,
                  maxShotWidth: 220,
                  radius: 24,
                ),
              ),
            ),
            ProblemSection(study),
            LivenessFlowSection(study),
            FeaturesSection(study),
            ArchitectureSection(study),
            ResultsSection(study),
            NextProject(study: study, onTap: _goToApps),
          ],
        ),
      ),
    );
  }
}
