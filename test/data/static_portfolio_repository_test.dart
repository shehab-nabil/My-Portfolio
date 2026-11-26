import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/features/portfolio/data/static_portfolio_repository.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';

void main() {
  final portfolio = const StaticPortfolioRepository().load();

  test('every section has a navigation label', () {
    for (final id in SectionId.values) {
      expect(portfolio.navigation.labelOf(id), isNotEmpty);
    }
  });

  test('the case study shows the featured app', () {
    expect(portfolio.caseStudy.project, same(portfolio.apps.featured));
  });

  test('exactly one job is marked current', () {
    expect(portfolio.experience.jobs.where((j) => j.current), hasLength(1));
  });
}
