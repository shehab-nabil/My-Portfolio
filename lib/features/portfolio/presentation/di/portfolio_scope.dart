import 'package:flutter/widgets.dart';

import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/domain/services/asset_resolver.dart';
import 'package:my_portfolio/features/portfolio/domain/services/link_launcher.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/section_requests.dart';

/// Hands the content and services down the tree. Widgets see only interfaces;
/// the concrete classes are chosen in `main.dart`.
class PortfolioScope extends InheritedWidget {
  const PortfolioScope({
    super.key,
    required this.portfolio,
    required this.links,
    required this.assets,
    required this.sectionRequests,
    required super.child,
  });

  final Portfolio portfolio;
  final LinkLauncher links;
  final AssetResolver assets;
  final SectionRequests sectionRequests;

  static PortfolioScope of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<PortfolioScope>()!;

  // Content only changes on hot reload (the constants are otherwise identical),
  // which rebuilds every widget anyway.
  @override
  bool updateShouldNotify(PortfolioScope oldWidget) =>
      !identical(portfolio, oldWidget.portfolio);
}

extension PortfolioContext on BuildContext {
  Portfolio get portfolio => PortfolioScope.of(this).portfolio;
  AssetResolver get assets => PortfolioScope.of(this).assets;
  SectionRequests get sectionRequests =>
      PortfolioScope.of(this).sectionRequests;

  void openLink(String url) => PortfolioScope.of(this).links.open(url);
}
