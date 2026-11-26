import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/section_id.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/logo.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/pill_button.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tappable.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key, required this.onSelect});

  final ValueChanged<SectionId> onSelect;

  @override
  Widget build(BuildContext context) {
    final navigation = context.portfolio.navigation;
    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Align(alignment: Alignment.centerLeft, child: Logo()),
            const SizedBox(height: 20),
            for (final id in SectionId.values)
              Tappable(
                isLink: true,
                onTap: () {
                  Scaffold.of(context).closeEndDrawer();
                  onSelect(id);
                },
                builder: (context, active) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    navigation.labelOf(id),
                    style: AppText.heading(
                      20,
                      color: active ? AppColors.accent : AppColors.ink,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            PillButton(
              label: navigation.downloadCv,
              onTap: () =>
                  context.openLink(context.portfolio.contactDetails.cvPath),
            ),
          ],
        ),
      ),
    );
  }
}
