import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/features/portfolio/presentation/controllers/section_spy.dart';

void main() {
  int at(double pixels) => activeSectionIndex(
    starts: [1000, 2000, 3000],
    pixels: pixels,
    maxScrollExtent: 3200,
    viewport: 800,
    barHeight: 72,
  );

  test('nothing is active over the hero', () => expect(at(0), -1));

  test('a section activates when it crosses the line', () {
    // The line sits 72 + 800 * 0.3 = 312px below the scroll offset.
    expect(at(687), -1);
    expect(at(688), 0);
    expect(at(1700), 1);
  });

  test('the end of the page activates the last section', () {
    expect(at(3199), 2);
  });

  test('a page too short to scroll stays on the hero', () {
    expect(
      activeSectionIndex(
        starts: [1000],
        pixels: 0,
        maxScrollExtent: 0,
        viewport: 800,
        barHeight: 72,
      ),
      -1,
    );
  });
}
