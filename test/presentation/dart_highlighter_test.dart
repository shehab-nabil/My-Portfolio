import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/dart_highlighter.dart';

void main() {
  test('spans join back to the original source', () {
    const code = "class A extends B {\n  final x = 'y'; // z\n}";
    expect(highlightDart(code).map((s) => s.text).join(), code);
  });

  test('classifies tokens', () {
    final tokens = {
      for (final s in highlightDart("@override final String a = 'b'; // c"))
        s.text: s.token,
    };
    expect(tokens['@override'], CodeToken.annotation);
    expect(tokens['final'], CodeToken.keyword);
    expect(tokens['String'], CodeToken.type);
    expect(tokens["'b'"], CodeToken.string);
    expect(tokens['// c'], CodeToken.comment);
  });
}
