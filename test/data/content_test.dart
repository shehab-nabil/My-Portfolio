import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/data/portfolio_data.dart';

void main() {
  test('every project image folder exists and is listed in pubspec.yaml', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final dirs = [
      PortfolioData.photoDir,
      PortfolioData.featured.assetDir,
      for (final project in PortfolioData.projects) project.assetDir,
    ];
    for (final dir in dirs) {
      expect(Directory(dir).existsSync(), isTrue, reason: dir);
      expect(pubspec, contains('- $dir'), reason: dir);
    }
  });

  test('the CV file is where the site links to it', () {
    expect(File('web/${PortfolioData.cvPath}').existsSync(), isTrue);
  });
}
