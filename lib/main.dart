import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:my_portfolio/app/portfolio_app.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/data/bundle_asset_resolver.dart';
import 'package:my_portfolio/features/portfolio/data/static_portfolio_repository.dart';
import 'package:my_portfolio/features/portfolio/data/url_link_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Composition root: the one place that picks concrete implementations.
Future<void> main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // The default 500ms makes scroll reveals feel late.
  VisibilityDetectorController.instance.updateInterval = const Duration(
    milliseconds: 80,
  );
  // The HTML splash stays up while these load, so there is no font flash.
  final (assets, _) = await (
    BundleAssetResolver.load(),
    AppText.preload(),
  ).wait;
  runApp(
    PortfolioApp(
      repository: const StaticPortfolioRepository(),
      links: const UrlLinkLauncher(),
      assets: assets,
    ),
  );
}
