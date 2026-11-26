/// Which section the reader is in, or -1 while still above the first one.
///
/// [starts] are the scroll offsets where each section begins. A section becomes
/// active once it passes a line 30% down the visible area below the top bar.
int activeSectionIndex({
  required List<double> starts,
  required double pixels,
  required double maxScrollExtent,
  required double viewport,
  required double barHeight,
}) {
  // The last section may be too short to ever reach the line.
  if (pixels > 0 && pixels >= maxScrollExtent - 2) return starts.length - 1;

  final line = pixels + barHeight + viewport * 0.3;
  var active = -1;
  for (var i = 0; i < starts.length; i++) {
    if (starts[i] <= line) active = i;
  }
  return active;
}
