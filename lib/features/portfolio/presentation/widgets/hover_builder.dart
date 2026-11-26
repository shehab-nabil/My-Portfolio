import 'package:flutter/material.dart';

/// Hover-only effect for things that are not themselves clickable.
class HoverBuilder extends StatefulWidget {
  const HoverBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, bool hovered) builder;

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
    // Defer so the text cursor of the surrounding SelectionArea still shows.
    cursor: MouseCursor.defer,
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: widget.builder(context, _hovered),
  );
}
