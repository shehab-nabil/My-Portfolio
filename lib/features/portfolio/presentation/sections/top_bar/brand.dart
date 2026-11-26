import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/logo.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tappable.dart';

class Brand extends StatelessWidget {
  const Brand({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final profile = context.portfolio.profile;
    final width = Layout.width(context);
    // Hidden on mobile, and where the desktop links need the room.
    final showRole =
        !Layout.isMobile(context) &&
        (width < Layout.desktopMin || width > 1130);
    return Tappable(
      onTap: onTap,
      label: profile.shortName,
      builder: (context, _) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Logo(),
          const SizedBox(width: 12),
          Text(
            profile.shortName,
            style: AppText.body(weight: FontWeight.w600, color: AppColors.ink),
          ),
          if (showRole) ...[
            const SizedBox(width: 8),
            Text(
              '· ${profile.role}',
              style: AppText.body(size: 14, color: AppColors.muted),
            ),
          ],
        ],
      ),
    );
  }
}
