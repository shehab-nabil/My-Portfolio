import 'dart:math' as math;

import 'package:flutter/widgets.dart';

abstract final class Layout {
  static const tabletMin = 600.0;
  static const desktopMin = 1024.0;
  static const maxContent = 1200.0;
  static const gap = 24.0;

  static double width(BuildContext c) => MediaQuery.sizeOf(c).width;
  static bool isMobile(BuildContext c) => width(c) < tabletMin;
  static bool isDesktop(BuildContext c) => width(c) >= desktopMin;

  static double sidePadding(BuildContext c) => isMobile(c) ? 20 : 24;
  static double barHeight(BuildContext c) => isMobile(c) ? 64 : 72;
  static double sectionSpacing(BuildContext c) => isMobile(c) ? 64 : 96;

  /// Equivalent of CSS `clamp(min, factor * vw, max)`.
  static double fluid(BuildContext c, double min, double max, double factor) =>
      math.min(max, math.max(min, width(c) * factor));
}
