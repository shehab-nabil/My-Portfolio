import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/scroll_flags.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/section_navigator.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/top_bar/bar_shell.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/top_bar/brand.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/top_bar/nav_links.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/pill_button.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.navigator,
    required this.flags,
    required this.onBrandTap,
  });

  final SectionNavigator navigator;
  final ScrollFlags flags;
  final VoidCallback onBrandTap;

  @override
  Widget build(BuildContext context) {
    final navigation = context.portfolio.navigation;
    return BarShell(
      scrolled: flags.scrolled,
      child: Row(
        children: [
          Brand(onTap: onBrandTap),
          const Spacer(),
          if (Layout.isDesktop(context)) ...[
            NavLinks(navigator: navigator),
            const SizedBox(width: 16),
            PillButton(
              label: navigation.downloadCv,
              height: 42,
              onTap: () =>
                  context.openLink(context.portfolio.contactDetails.cvPath),
            ),
          ] else
            IconButton(
              tooltip: navigation.openMenu,
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const Icon(Icons.menu, color: AppColors.ink),
            ),
        ],
      ),
    );
  }
}
