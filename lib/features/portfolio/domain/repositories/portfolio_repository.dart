import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';

/// Where the content comes from. A CMS or JSON source would implement this too.
abstract interface class PortfolioRepository {
  Portfolio load();
}
