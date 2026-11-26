/// Fails when a layer imports something it must not know about.
library;

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const feature = 'lib/features/portfolio';
const featureUri = 'package:my_portfolio/features/portfolio';

/// Every `import`/`export` target of each Dart file under [dir].
Map<String, List<String>> importsUnder(String dir) {
  final directive = RegExp("^(?:import|export) '([^']+)'", multiLine: true);
  final files = Directory(dir)
      .listSync(recursive: true)
      .whereType<File>()
      .where(
        (f) =>
            f.path.endsWith('.dart') &&
            !f.uri.pathSegments.last.startsWith('.'),
      );
  final result = {
    for (final file in files)
      file.path: [
        for (final m in directive.allMatches(file.readAsStringSync())) m[1]!,
      ],
  };
  expect(result, isNotEmpty, reason: 'no Dart files under $dir');
  return result;
}

void expectNoImports(String dir, bool Function(String uri) forbidden) {
  final violations = [
    for (final entry in importsUnder(dir).entries)
      for (final uri in entry.value)
        if (forbidden(uri)) '${entry.key} imports $uri',
  ];
  expect(violations, isEmpty);
}

void main() {
  test('domain is pure Dart and depends on no outer layer', () {
    expectNoImports(
      '$feature/domain',
      (uri) =>
          uri == 'dart:ui' ||
          (uri.startsWith('package:') &&
              !uri.startsWith('$featureUri/domain/')),
    );
  });

  test('presentation never reaches into data or raw content', () {
    expectNoImports(
      '$feature/presentation',
      (uri) =>
          uri.startsWith('$featureUri/data/') ||
          uri.startsWith('package:my_portfolio/data/') ||
          uri.startsWith('package:url_launcher/'),
    );
  });

  test('core does not depend on features, data or the app layer', () {
    expectNoImports(
      'lib/core',
      (uri) =>
          RegExp('package:my_portfolio/(features|data|app)/').hasMatch(uri),
    );
  });

  test('only the repository reads the content file', () {
    final readers = [
      for (final entry in importsUnder('lib').entries)
        if (entry.value.any((uri) => uri.endsWith('portfolio_data.dart')))
          entry.key,
    ];
    expect(readers, ['$feature/data/static_portfolio_repository.dart']);
  });
}
