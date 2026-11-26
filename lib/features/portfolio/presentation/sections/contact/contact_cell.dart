import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tappable.dart';

class ContactCell extends StatelessWidget {
  const ContactCell(this.label, this.link, {super.key});

  final String label;
  final LinkItem link;

  @override
  Widget build(BuildContext context) => Tappable(
    isLink: true,
    onTap: () => context.openLink(link.url),
    builder: (context, active) => AnimatedContainer(
      duration: Motion.of(context, Motion.hover),
      transform: Matrix4.translationValues(
        0,
        active && !Motion.reduced(context) ? -4 : 0,
        0,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.darkRaised,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: active ? AppColors.accentOnDark : const Color(0x1FFFFFFF),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${label.toUpperCase()} ↗',
            style: AppText.label(color: AppColors.onDarkMuted),
          ),
          const SizedBox(height: 10),
          Text(
            link.label,
            style: AppText.body(
              size: 14,
              weight: FontWeight.w500,
              color: AppColors.onDark,
            ),
          ),
        ],
      ),
    ),
  );
}
