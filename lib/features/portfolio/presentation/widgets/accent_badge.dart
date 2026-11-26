import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';

class AccentBadge extends StatelessWidget {
  const AccentBadge(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: AppColors.accentSoft,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      text,
      style: AppText.body(
        size: 12,
        weight: FontWeight.w600,
        color: AppColors.onAccentSoft,
      ),
    ),
  );
}
