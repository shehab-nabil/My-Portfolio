import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/section_id.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/section_navigator.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tappable.dart';

/// Menu items with an accent underline that slides to the active one.
class NavLinks extends StatefulWidget {
  const NavLinks({super.key, required this.navigator});

  final SectionNavigator navigator;

  @override
  State<NavLinks> createState() => _NavLinksState();
}

class _NavLinksState extends State<NavLinks> {
  static const _pad = 12.0;

  final _stackKey = GlobalKey();
  final _itemKeys = [for (final _ in SectionId.values) GlobalKey()];
  List<Rect> _rects = const [];
  Rect? _last;

  void _measure() {
    if (!mounted) return;
    final stack = _stackKey.currentContext?.findRenderObject() as RenderBox?;
    if (stack == null) return;
    final rects = <Rect>[];
    for (final key in _itemKeys) {
      final box = key.currentContext?.findRenderObject() as RenderBox?;
      if (box == null) return;
      rects.add(box.localToGlobal(Offset.zero, ancestor: stack) & box.size);
    }
    if (rects.toString() != _rects.toString()) setState(() => _rects = rects);
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context); // Re-measure after resizes.
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
    return ValueListenableBuilder<int>(
      valueListenable: widget.navigator.active,
      builder: (context, active, _) {
        if (active >= 0 && active < _rects.length) _last = _rects[active];
        final rect = _last;
        return Stack(
          key: _stackKey,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final id in SectionId.values)
                  Tappable(
                    key: _itemKeys[id.index],
                    isLink: true,
                    onTap: () => widget.navigator.scrollTo(context, id),
                    builder: (context, hovered) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _pad,
                        vertical: 12,
                      ),
                      child: AnimatedDefaultTextStyle(
                        duration: Motion.of(context, Motion.hover),
                        style: AppText.body(
                          size: 14,
                          weight: FontWeight.w500,
                          color: hovered || active == id.index
                              ? AppColors.ink
                              : AppColors.muted,
                        ),
                        child: Text(context.portfolio.navigation.labelOf(id)),
                      ),
                    ),
                  ),
              ],
            ),
            if (rect != null)
              AnimatedPositioned(
                duration: Motion.of(context, Motion.underline),
                curve: Curves.easeOutCubic,
                left: rect.left + _pad,
                width: rect.width - _pad * 2,
                bottom: 4,
                height: 2,
                child: AnimatedOpacity(
                  duration: Motion.of(context, Motion.underline),
                  opacity: active < 0 ? 0 : 1,
                  child: const ColoredBox(color: AppColors.accent),
                ),
              ),
          ],
        );
      },
    );
  }
}
