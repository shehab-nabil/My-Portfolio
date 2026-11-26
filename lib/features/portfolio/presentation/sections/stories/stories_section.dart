import 'package:flutter/material.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/stories/story_card.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/responsive_grid.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/section.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection(this.content, {super.key});

  final StoriesContent content;

  @override
  Widget build(BuildContext context) => Section(
    heading: content.heading,
    child: ResponsiveGrid(
      minItemWidth: 340,
      children: [
        for (final (i, story) in content.stories.indexed)
          StoryCard(content: content, story: story, variant: _variantOf(i)),
      ],
    ),
  );

  /// The first story is highlighted and the last one is dark.
  StoryCardVariant _variantOf(int index) {
    if (index == 0) return StoryCardVariant.featured;
    if (index == content.stories.length - 1) return StoryCardVariant.dark;
    return StoryCardVariant.standard;
  }
}
