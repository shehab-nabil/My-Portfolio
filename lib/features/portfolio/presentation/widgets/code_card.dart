import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/dart_highlighter.dart';

/// Dark editor card with a small Dart syntax highlighter.
class CodeCard extends StatelessWidget {
  const CodeCard({super.key, required this.fileName, required this.code});

  final String fileName;
  final String code;

  static Color? _colorOf(CodeToken token) => switch (token) {
    CodeToken.plain => null,
    CodeToken.comment => const Color(0xFF7D848E),
    CodeToken.string => const Color(0xFF9BE3B0),
    CodeToken.annotation => const Color(0xFFE5C07B),
    CodeToken.keyword => AppColors.accentOnDark,
    CodeToken.type => const Color(0xFF7FD6E8),
  };

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.darkRaised,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0x1FFFFFFF))),
          ),
          child: Row(
            children: [
              for (var i = 0; i < 3; i++)
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: const BoxDecoration(
                    color: Color(0x33FFFFFF),
                    shape: BoxShape.circle,
                  ),
                ),
              const SizedBox(width: 8),
              Text(
                fileName,
                style: AppText.mono(size: 12, color: AppColors.onDarkMuted),
              ),
            ],
          ),
        ),
        // Shrinks to fit narrow screens instead of scrolling or wrapping.
        Padding(
          padding: const EdgeInsets.all(18),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [
                  for (final span in highlightDart(code))
                    TextSpan(
                      text: span.text,
                      style: TextStyle(color: _colorOf(span.token)),
                    ),
                ],
              ),
              softWrap: false,
              style: AppText.mono(
                size: 13,
                color: AppColors.onDark,
                height: 1.75,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
