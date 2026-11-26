import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/content.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/screenshot.dart';

/// Three screenshots on accent-soft with the middle one raised.
class ScreenshotBand extends StatelessWidget {
  const ScreenshotBand({
    super.key,
    required this.project,
    this.maxShotWidth = 150,
    this.radius = 18,
  });

  final Project project;
  final double maxShotWidth;
  final double radius;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
    decoration: BoxDecoration(
      color: AppColors.accentSoft,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: LayoutBuilder(
      builder: (context, constraints) {
        const gap = 14.0;
        const lift = 22.0;
        final width = ((constraints.maxWidth - gap * 2) / 3).clamp(
          0.0,
          maxShotWidth,
        );
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 1; i <= 3; i++) ...[
              if (i > 1) const SizedBox(width: gap),
              Padding(
                padding: EdgeInsets.only(
                  top: i == 2 ? 0 : lift,
                  bottom: i == 2 ? lift : 0,
                ),
                child: Screenshot(project: project, index: i, width: width),
              ),
            ],
          ],
        );
      },
    ),
  );
}
