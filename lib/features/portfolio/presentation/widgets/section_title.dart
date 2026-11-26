import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/content.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.heading, {super.key});

  final SectionHeading heading;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        heading.label.toUpperCase(),
        style: AppText.label(color: AppColors.accent, size: 13),
      ),
      const SizedBox(height: 12),
      Semantics(
        header: true,
        child: Text(
          heading.title,
          style: AppText.heading(Layout.fluid(context, 32, 48, 0.038)),
        ),
      ),
    ],
  );
}
