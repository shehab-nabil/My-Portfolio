import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/content.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/asset_box.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/hover_builder.dart';

/// One phone screenshot, scaling to 1.03 on hover.
class Screenshot extends StatelessWidget {
  const Screenshot({
    super.key,
    required this.project,
    required this.index,
    required this.width,
  });

  static const aspect = 19 / 9;

  final Project project;

  /// 1-based, matching `screen1`..`screen3`.
  final int index;
  final double width;

  @override
  Widget build(BuildContext context) {
    final placeholder = context.portfolio.apps.screenPlaceholder;
    return HoverBuilder(
      builder: (context, hovered) => AnimatedScale(
        scale: hovered && !Motion.reduced(context) ? 1.03 : 1,
        duration: Motion.of(context, Motion.hover),
        curve: Curves.easeOut,
        child: AssetBox(
          dir: project.assetDir,
          name: 'screen$index',
          placeholder: placeholder(index),
          semanticLabel: '${project.name} ${placeholder(index)}',
          width: width,
          height: width * aspect,
          radius: 14,
        ),
      ),
    );
  }
}
