import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/bullet.dart';

class TimelineEntry extends StatelessWidget {
  const TimelineEntry(this.job, {super.key, required this.last});

  final Experience job;
  final bool last;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      const Positioned(
        left: 7,
        top: 0,
        bottom: 0,
        width: 2,
        child: ColoredBox(color: AppColors.border),
      ),
      Positioned(
        left: 0,
        top: 5,
        child: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: job.current ? AppColors.accent : AppColors.surface,
            border: Border.all(
              width: 2,
              color: job.current ? AppColors.accent : AppColors.borderStrong,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 36, bottom: last ? 0 : 40),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: '${job.role} · ',
                  children: [
                    TextSpan(
                      text: job.company,
                      style: const TextStyle(color: AppColors.accent),
                    ),
                  ],
                ),
                style: AppText.heading(20),
              ),
              const SizedBox(height: 6),
              Text(job.dates, style: AppText.mono()),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Column(
                  children: [for (final b in job.bullets) Bullet(b)],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
