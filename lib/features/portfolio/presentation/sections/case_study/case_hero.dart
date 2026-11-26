import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/page_container.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/reveal.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/text_link.dart';

class CaseHero extends StatelessWidget {
  const CaseHero({super.key, required this.study, required this.onBack});

  final CaseStudy study;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 40),
    child: PageContainer(
      child: Reveal(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextLink(label: '← ${study.back}', onTap: onBack),
            const SizedBox(height: 24),
            Text(
              study.label.toUpperCase(),
              style: AppText.label(color: AppColors.accent, size: 13),
            ),
            const SizedBox(height: 12),
            Semantics(
              header: true,
              child: Text(
                study.title,
                style: AppText.heading(Layout.fluid(context, 40, 68, 0.047)),
              ),
            ),
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Text(study.intro, style: AppText.body(size: 18)),
            ),
            const SizedBox(height: 32),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = Layout.isMobile(context) ? 2 : 4;
                final width =
                    (constraints.maxWidth - Layout.gap * (columns - 1)) /
                    columns;
                return Wrap(
                  spacing: Layout.gap,
                  runSpacing: Layout.gap,
                  children: [
                    for (final fact in study.facts)
                      Container(
                        width: width,
                        padding: const EdgeInsets.only(top: 14),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: AppColors.borderStrong),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fact.label.toUpperCase(),
                              style: AppText.label(),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              fact.value,
                              style: AppText.body(
                                size: 15,
                                weight: FontWeight.w600,
                                color: AppColors.ink,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
