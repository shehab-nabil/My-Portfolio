import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/reveal.dart';

/// Equal-height rows of cards. Column count follows [minItemWidth]; every item
/// reveals with a stagger. Children must support intrinsic sizing.
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    required this.minItemWidth,
    this.maxColumns = 3,
    this.gap = Layout.gap,
  });

  final List<Widget> children;
  final double minItemWidth;
  final int maxColumns;
  final double gap;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      var columns = ((constraints.maxWidth + gap) / (minItemWidth + gap))
          .floor()
          .clamp(1, maxColumns);
      if (Layout.isMobile(context)) columns = 1;
      // Avoid a lonely last item in four-cell grids.
      if (columns == 3 && children.length == 4) columns = 2;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var start = 0; start < children.length; start += columns) ...[
            if (start > 0) SizedBox(height: gap),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < columns; i++) ...[
                    if (i > 0) SizedBox(width: gap),
                    Expanded(
                      child: start + i < children.length
                          ? Reveal(
                              delay: Motion.stagger(start + i),
                              child: children[start + i],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      );
    },
  );
}
