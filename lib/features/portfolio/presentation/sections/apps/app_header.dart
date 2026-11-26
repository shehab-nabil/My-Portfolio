import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/asset_box.dart';

class AppHeader extends StatelessWidget {
  const AppHeader(this.project, {super.key, this.titleSize = 20});

  final Project project;
  final double titleSize;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      AssetBox(
        dir: project.assetDir,
        name: 'icon',
        placeholder: context.portfolio.apps.iconPlaceholder,
        semanticLabel: project.name,
        width: 52,
        height: 52,
        radius: 14,
      ),
      const SizedBox(width: 14),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.name, style: AppText.heading(titleSize)),
            const SizedBox(height: 2),
            Text(
              project.subtitle,
              style: AppText.body(size: 14, color: AppColors.muted),
            ),
          ],
        ),
      ),
    ],
  );
}
