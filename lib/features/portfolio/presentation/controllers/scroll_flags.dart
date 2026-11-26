import 'package:flutter/widgets.dart';

/// The two facts about scrolling that the bar and back-to-top button care about.
class ScrollFlags {
  ScrollFlags(this._controller) {
    _controller.addListener(update);
  }

  final ScrollController _controller;

  final scrolled = ValueNotifier<bool>(false);
  final pastFirstScreen = ValueNotifier<bool>(false);

  void update() {
    if (!_controller.hasClients) return;
    final position = _controller.position;
    if (!position.hasContentDimensions) return;
    scrolled.value = position.pixels > 8;
    pastFirstScreen.value = position.pixels > position.viewportDimension;
  }

  void dispose() {
    _controller.removeListener(update);
    scrolled.dispose();
    pastFirstScreen.dispose();
  }
}
