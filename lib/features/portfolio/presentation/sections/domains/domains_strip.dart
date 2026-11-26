import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/page_container.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/reveal.dart';

class DomainsStrip extends StatelessWidget {
  const DomainsStrip(this.domains, {super.key});

  final List<String> domains;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 24),
    decoration: const BoxDecoration(
      color: AppColors.surface,
      border: Border.symmetric(horizontal: BorderSide(color: AppColors.border)),
    ),
    child: PageContainer(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        runSpacing: 10,
        children: [
          for (final (i, domain) in domains.indexed)
            Reveal(
              delay: Duration(milliseconds: i * 70),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(domain, style: AppText.heading(17)),
                  if (i < domains.length - 1) ...[
                    const SizedBox(width: 20),
                    Text(
                      '·',
                      style: AppText.heading(17, color: AppColors.accent),
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
    ),
  );
}
