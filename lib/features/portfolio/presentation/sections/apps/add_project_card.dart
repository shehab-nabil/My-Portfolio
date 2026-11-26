import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/dashed_border_painter.dart';

class AddProjectCard extends StatelessWidget {
  const AddProjectCard({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: const DashedBorderPainter(),
    child: ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 220),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, size: 28, color: AppColors.muted),
            const SizedBox(height: 12),
            Text(title, style: AppText.heading(18)),
            const SizedBox(height: 6),
            Text(
              body,
              textAlign: TextAlign.center,
              style: AppText.mono(size: 12),
            ),
          ],
        ),
      ),
    ),
  );
}
