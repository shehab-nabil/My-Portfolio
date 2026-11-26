import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/features/portfolio/domain/services/link_policy.dart';

void main() {
  test('placeholders open nowhere', () {
    expect(linkTargetFor('[linkedin.com/in/handle]'), isNull);
  });

  test('mail and phone links stay in the same tab', () {
    expect(linkTargetFor('mailto:a@example.com'), LinkTarget.sameTab);
    expect(linkTargetFor('tel:+100'), LinkTarget.sameTab);
  });

  test('web pages and the relative CV path open a new tab', () {
    expect(linkTargetFor('https://example.com'), LinkTarget.newTab);
    expect(linkTargetFor('cv/file.pdf'), LinkTarget.newTab);
  });
}
