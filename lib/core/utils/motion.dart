import 'package:flutter/widgets.dart';

abstract final class Motion {
  static const hover = Duration(milliseconds: 200);
  static const underline = Duration(milliseconds: 250);
  static const reveal = Duration(milliseconds: 550);
  static const scroll = Duration(milliseconds: 700);

  static const revealCurve = Curves.easeOutCubic;
  static const scrollCurve = Curves.easeInOutCubic;

  static bool reduced(BuildContext c) => MediaQuery.disableAnimationsOf(c);

  /// [value], or zero when the visitor asked for reduced motion.
  static Duration of(BuildContext c, Duration value) =>
      reduced(c) ? Duration.zero : value;

  /// Grid/list stagger, capped so nothing feels slow.
  static Duration stagger(int index) =>
      Duration(milliseconds: (index * 70).clamp(0, 400));
}
