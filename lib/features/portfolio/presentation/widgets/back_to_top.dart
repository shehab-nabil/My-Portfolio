import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/tappable.dart';

class BackToTop extends StatelessWidget {
  const BackToTop({
    super.key,
    required this.visible,
    required this.label,
    required this.onTap,
  });

  final ValueNotifier<bool> visible;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
    valueListenable: visible,
    builder: (context, show, child) => IgnorePointer(
      ignoring: !show,
      child: ExcludeFocus(
        excluding: !show,
        child: ExcludeSemantics(
          excluding: !show,
          child: AnimatedOpacity(
            opacity: show ? 1 : 0,
            duration: Motion.of(context, Motion.underline),
            child: child,
          ),
        ),
      ),
    ),
    child: SelectionContainer.disabled(
      child: Tappable(
        label: label,
        onTap: onTap,
        builder: (context, active) => AnimatedContainer(
          duration: Motion.of(context, Motion.hover),
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: active ? AppColors.accent : AppColors.ink,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_upward, size: 20, color: Colors.white),
        ),
      ),
    ),
  );
}
