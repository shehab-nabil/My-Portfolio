import 'package:flutter/material.dart';
import 'package:my_portfolio/app/router.dart';
import 'package:my_portfolio/core/theme/app_theme.dart';
import 'package:my_portfolio/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:my_portfolio/features/portfolio/domain/services/asset_resolver.dart';
import 'package:my_portfolio/features/portfolio/domain/services/link_launcher.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/section_requests.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({
    super.key,
    required this.repository,
    required this.links,
    required this.assets,
  });

  final PortfolioRepository repository;
  final LinkLauncher links;
  final AssetResolver assets;

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  final _router = buildRouter();
  final _sectionRequests = SectionRequests();

  @override
  void dispose() {
    _router.dispose();
    _sectionRequests.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Loaded here, not cached in State, so hot reload picks up content edits.
    final portfolio = widget.repository.load();
    return PortfolioScope(
      portfolio: portfolio,
      links: widget.links,
      assets: widget.assets,
      sectionRequests: _sectionRequests,
      child: MaterialApp.router(
        title: '${portfolio.profile.fullName} · ${portfolio.profile.role}',
        debugShowCheckedModeBanner: false,
        theme: buildAppTheme(),
        routerConfig: _router,
      ),
    );
  }
}
