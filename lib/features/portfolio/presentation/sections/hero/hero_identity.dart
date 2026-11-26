import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/asset_box.dart';

class HeroIdentity extends StatelessWidget {
  const HeroIdentity(this.profile, {super.key});

  final Profile profile;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      AssetBox(
        dir: profile.photoDir,
        name: 'photo',
        placeholder: profile.photoPlaceholder,
        semanticLabel: profile.fullName,
        width: 84,
        height: 84,
        radius: 42,
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(profile.fullName, style: AppText.heading(20)),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 7, right: 8),
                  decoration: const BoxDecoration(
                    color: AppColors.available,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    profile.availability,
                    style: AppText.body(size: 14, color: AppColors.muted),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
