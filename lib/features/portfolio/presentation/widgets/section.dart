import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/content.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/page_container.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/reveal.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/section_title.dart';

/// A vertically padded section, optionally on a bordered white band.
class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.child,
    this.heading,
    this.band = false,
  });

  final Widget child;
  final SectionHeading? heading;
  final bool band;

  @override
  Widget build(BuildContext context) {
    final space = Layout.sectionSpacing(context);
    return DecoratedBox(
      decoration: band
          ? const BoxDecoration(
              color: AppColors.surface,
              border: Border.symmetric(
                horizontal: BorderSide(color: AppColors.border),
              ),
            )
          : const BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: space * 0.75),
        child: PageContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (heading != null) ...[
                Reveal(child: SectionTitle(heading!)),
                const SizedBox(height: 40),
              ],
              child,
            ],
          ),
        ),
      ),
    );
  }
}
