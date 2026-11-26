import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/hover_card.dart';

enum StoryCardVariant { standard, featured, dark }

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.content,
    required this.story,
    required this.variant,
  });

  /// Supplies the paragraph labels.
  final StoriesContent content;

  final Story story;
  final StoryCardVariant variant;

  @override
  Widget build(BuildContext context) {
    final dark = variant == StoryCardVariant.dark;
    final featured = variant == StoryCardVariant.featured;
    final strong = dark ? AppColors.onDark : AppColors.ink;
    final soft = dark ? AppColors.onDarkMuted : AppColors.body;

    Widget paragraph(String label, String text) => Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label ',
              style: TextStyle(fontWeight: FontWeight.w600, color: strong),
            ),
            TextSpan(text: text),
          ],
        ),
        style: AppText.body(size: 15, color: soft),
      ),
    );

    return HoverCard(
      color: dark ? AppColors.dark : AppColors.surface,
      borderColor: featured
          ? AppColors.accent
          : (dark ? AppColors.dark : AppColors.border),
      hoverBorderColor: featured
          ? AppColors.accentHover
          : (dark ? AppColors.accentOnDark : AppColors.borderStrong),
      borderWidth: featured ? 1.5 : 1,
      padding: EdgeInsets.all(Layout.isMobile(context) ? 20 : 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            story.headline,
            style: AppText.heading(
              Layout.isMobile(context) ? 34 : 40,
              color: dark ? AppColors.accentOnDark : AppColors.accent,
            ),
          ),
          const SizedBox(height: 16),
          Text(story.title, style: AppText.heading(19, color: strong)),
          paragraph(content.challengeLabel, story.challenge),
          paragraph(content.approachLabel, story.approach),
          paragraph(content.resultLabel, story.result),
        ],
      ),
    );
  }
}
