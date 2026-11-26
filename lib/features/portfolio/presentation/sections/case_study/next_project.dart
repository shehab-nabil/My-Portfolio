import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/page_container.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/reveal.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tappable.dart';

class NextProject extends StatelessWidget {
  const NextProject({super.key, required this.study, required this.onTap});

  final CaseStudy study;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 24, bottom: 64),
    child: PageContainer(
      child: Reveal(
        child: SelectionContainer.disabled(
          child: Tappable(
            isLink: true,
            onTap: onTap,
            builder: (context, active) => Container(
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: active ? AppColors.accent : AppColors.borderStrong,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    study.nextProjectLabel.toUpperCase(),
                    style: AppText.label(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${study.nextProjectName} →',
                    style: AppText.heading(
                      Layout.fluid(context, 32, 48, 0.038),
                      color: active ? AppColors.accent : AppColors.ink,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
