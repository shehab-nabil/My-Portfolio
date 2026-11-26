import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';

/// Sets the browser tab title, only while this route is the one on screen.
class PageTitle extends StatefulWidget {
  const PageTitle({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  State<PageTitle> createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  // Runs again whenever the route becomes, or stops being, the current one.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _apply();
  }

  @override
  void didUpdateWidget(PageTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title) _apply();
  }

  void _apply() {
    if (!(ModalRoute.isCurrentOf(context) ?? true)) return;
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: widget.title,
        primaryColor: AppColors.ink.toARGB32(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
