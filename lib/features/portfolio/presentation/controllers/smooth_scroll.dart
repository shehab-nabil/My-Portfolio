import 'package:flutter/widgets.dart';

import 'package:my_portfolio/core/utils/motion.dart';

extension SmoothScroll on ScrollController {
  /// Animates to [target], or jumps there when reduced motion is requested.
  void smoothTo(BuildContext context, double target) {
    if (!hasClients) return;
    final offset = target.clamp(0.0, position.maxScrollExtent);
    if (Motion.reduced(context)) {
      jumpTo(offset);
    } else {
      animateTo(offset, duration: Motion.scroll, curve: Motion.scrollCurve);
    }
  }
}
