import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';

/// Shows `<dir><name>.*` if it has been added, else a neutral placeholder box.
class AssetBox extends StatelessWidget {
  const AssetBox({
    super.key,
    required this.dir,
    required this.name,
    required this.placeholder,
    required this.width,
    required this.height,
    required this.radius,
    this.semanticLabel,
  });

  final String dir;
  final String name;
  final String placeholder;
  final double width;
  final double height;
  final double radius;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final path = context.assets.find(dir, name);
    final empty = Center(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          placeholder,
          textAlign: TextAlign.center,
          style: AppText.mono(size: width < 100 ? 9 : 12),
        ),
      ),
    );
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(radius),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColors.border),
      ),
      child: path == null
          ? empty
          : Image.asset(
              path,
              fit: BoxFit.cover,
              semanticLabel: semanticLabel,
              // Decode near display size to keep scrolling light.
              cacheWidth: (width * MediaQuery.devicePixelRatioOf(context) * 1.1)
                  .round(),
              errorBuilder: (_, _, _) => empty,
            ),
    );
  }
}
