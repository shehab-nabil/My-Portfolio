import 'package:flutter/material.dart';

/// The one building block for everything clickable: pointer cursor, hover and
/// keyboard focus state, Enter/Space activation and semantics.
class Tappable extends StatefulWidget {
  const Tappable({
    super.key,
    required this.onTap,
    required this.builder,
    this.label,
    this.isLink = false,
  });

  final VoidCallback onTap;

  /// [active] is true while hovered or keyboard-focused.
  final Widget Function(BuildContext context, bool active) builder;
  final String? label;
  final bool isLink;

  @override
  State<Tappable> createState() => _TappableState();
}

class _TappableState extends State<Tappable> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) => Semantics(
    button: !widget.isLink,
    link: widget.isLink,
    label: widget.label,
    child: FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      onShowHoverHighlight: (v) => setState(() => _hovered = v),
      onShowFocusHighlight: (v) => setState(() => _focused = v),
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onTap();
            return null;
          },
        ),
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: widget.builder(context, _hovered || _focused),
      ),
    ),
  );
}
