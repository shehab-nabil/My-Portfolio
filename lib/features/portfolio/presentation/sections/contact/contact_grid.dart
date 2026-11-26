import 'package:flutter/material.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/contact/contact_cell.dart';

class ContactGrid extends StatelessWidget {
  const ContactGrid({super.key, required this.cells, required this.columns});

  final List<(String, LinkItem)> cells;
  final int columns;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (var start = 0; start < cells.length; start += columns) ...[
        if (start > 0) const SizedBox(height: 12),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = start; i < start + columns; i++) ...[
                if (i > start) const SizedBox(width: 12),
                Expanded(child: ContactCell(cells[i].$1, cells[i].$2)),
              ],
            ],
          ),
        ),
      ],
    ],
  );
}
