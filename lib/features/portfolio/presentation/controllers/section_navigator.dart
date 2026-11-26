import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:my_portfolio/features/portfolio/domain/entities/section_id.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/section_spy.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/smooth_scroll.dart';

/// Jumps to sections and tracks which one is on screen.
class SectionNavigator {
  SectionNavigator(this._controller) {
    _controller.addListener(_spy);
  }

  final ScrollController _controller;
  final keys = {for (final id in SectionId.values) id: GlobalKey()};

  /// Index into [SectionId.values], or -1 while the hero is showing.
  final active = ValueNotifier<int>(-1);

  /// Height of the sticky bar that overlaps the scroll view.
  double barHeight = 0;

  /// Cached section offsets. Cleared on layout changes.
  List<double>? _starts;

  void invalidate() {
    _starts = null;
    _spy();
  }

  void scrollTo(BuildContext context, SectionId id) {
    final start = _startOf(id);
    if (start != null) _controller.smoothTo(context, start - barHeight);
  }

  double? _startOf(SectionId id) {
    final box = keys[id]!.currentContext?.findRenderObject();
    if (box == null || !box.attached) return null;
    return RenderAbstractViewport.of(box).getOffsetToReveal(box, 0).offset;
  }

  void _spy() {
    if (!_controller.hasClients) return;
    final position = _controller.position;
    if (!position.hasContentDimensions) return;
    active.value = activeSectionIndex(
      starts: _starts ??= [
        for (final id in SectionId.values) _startOf(id) ?? double.infinity,
      ],
      pixels: position.pixels,
      maxScrollExtent: position.maxScrollExtent,
      viewport: position.viewportDimension,
      barHeight: barHeight,
    );
  }

  void dispose() {
    _controller.removeListener(_spy);
    active.dispose();
  }
}
