import 'package:flutter/material.dart';

/// Builds [child] only once its route has been on screen.
///
/// On a direct visit to a nested route the parent page sits underneath, never
/// laid out, which breaks text selection. Once built, the child stays built.
class DeferUntilShown extends StatefulWidget {
  const DeferUntilShown({super.key, required this.child});

  final Widget child;

  @override
  State<DeferUntilShown> createState() => _DeferUntilShownState();
}

class _DeferUntilShownState extends State<DeferUntilShown> {
  bool _shown = false;

  @override
  Widget build(BuildContext context) {
    _shown = _shown || (ModalRoute.isCurrentOf(context) ?? true);
    return _shown ? widget.child : const Scaffold();
  }
}
