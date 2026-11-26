import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_portfolio/core/theme/app_colors.dart';

abstract final class AppText {
  /// Covers glyphs the Latin fonts lack (the Arabic story headline and its
  /// two-way arrow). Preloaded so they never flash as missing-glyph boxes.
  static final List<String> _fallback = [
    GoogleFonts.notoSansArabic(fontWeight: FontWeight.w600).fontFamily!,
    GoogleFonts.notoSansMath().fontFamily!,
  ];

  static TextStyle heading(double size, {Color color = AppColors.ink}) =>
      GoogleFonts.spaceGrotesk(
        fontSize: size,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.02 * size,
        height: 1.12,
        color: color,
      ).copyWith(fontFamilyFallback: _fallback);

  static TextStyle body({
    double size = 16,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.body,
    double height = 1.55,
  }) => GoogleFonts.inter(
    fontSize: size,
    fontWeight: weight,
    height: height,
    color: color,
  ).copyWith(fontFamilyFallback: _fallback);

  static TextStyle mono({
    double size = 13,
    Color color = AppColors.muted,
    FontWeight weight = FontWeight.w400,
    double tracking = 0,
    double height = 1.5,
  }) => GoogleFonts.jetBrainsMono(
    fontSize: size,
    fontWeight: weight,
    letterSpacing: tracking * size,
    height: height,
    color: color,
  );

  /// Small uppercase label. Callers pass already-uppercased text.
  static TextStyle label({Color color = AppColors.muted, double size = 12}) =>
      mono(size: size, color: color, tracking: 0.06, weight: FontWeight.w500);

  /// Requests every face used by the site so it can be awaited before paint.
  static Future<void> preload() async {
    for (final weight in [FontWeight.w400, FontWeight.w500, FontWeight.w600]) {
      body(weight: weight);
      mono(weight: weight);
    }
    heading(32);
    try {
      await GoogleFonts.pendingFonts().timeout(const Duration(seconds: 4));
    } catch (_) {
      // Offline or slow: render with the fallback font rather than block.
    }
  }
}
