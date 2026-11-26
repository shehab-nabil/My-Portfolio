import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';

/// Centres content at max 1200px with the side padding for the screen size.
class PageContainer extends StatelessWidget {
  const PageContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final side = Layout.sidePadding(context);
    return Align(
      alignment: Alignment.topCenter,
      heightFactor: 1,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Layout.maxContent + side * 2),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: side),
          child: SizedBox(width: double.infinity, child: child),
        ),
      ),
    );
  }
}
