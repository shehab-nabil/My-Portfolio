import 'package:flutter/material.dart';

/// Puts keyboard focus inside the scroll view, so arrows, Page Up/Down and
/// Space scroll straight after load, as on a normal web page.
class KeyboardScrollFocus extends StatelessWidget {
  const KeyboardScrollFocus({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      Focus(autofocus: true, skipTraversal: true, child: child);
}
