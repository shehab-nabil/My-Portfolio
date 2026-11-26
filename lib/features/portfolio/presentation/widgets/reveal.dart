import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/motion.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Fades and slides its child in the first time it scrolls into view.
class Reveal extends StatefulWidget {
  const Reveal({super.key, required this.child, this.delay = Duration.zero});

  final Widget child;
  final Duration delay;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  final Key _detectorKey = UniqueKey();
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Motion.reveal,
  );
  late final Animation<double> _progress = CurvedAnimation(
    parent: _controller,
    curve: Motion.revealCurve,
  );
  Timer? _timer;
  bool _seen = false;

  void _onVisibility(VisibilityInfo info) {
    if (_seen || !mounted) return;
    // The height test covers blocks too tall to ever be 15% visible.
    final tallEnough =
        info.visibleBounds.height > MediaQuery.sizeOf(context).height * 0.5;
    if (info.visibleFraction <= 0.15 && !tallEnough) return;
    _seen = true;
    _timer = Timer(widget.delay, _controller.forward);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Motion.reduced(context)) return widget.child;
    return VisibilityDetector(
      key: _detectorKey,
      onVisibilityChanged: _onVisibility,
      child: AnimatedBuilder(
        animation: _progress,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, 24 * (1 - _progress.value)),
          child: child,
        ),
        child: FadeTransition(
          opacity: _progress,
          // Keep content in the accessibility tree before it has revealed.
          alwaysIncludeSemantics: true,
          child: RepaintBoundary(child: widget.child),
        ),
      ),
    );
  }
}
