import 'package:flutter/foundation.dart';

import 'package:my_portfolio/features/portfolio/domain/entities/section_id.dart';

/// Lets another route ask the home page to scroll to a section.
class SectionRequests extends ChangeNotifier {
  SectionId? _pending;

  void request(SectionId id) {
    _pending = id;
    notifyListeners();
  }

  /// Returns the pending request, if any, and clears it.
  SectionId? take() {
    final id = _pending;
    _pending = null;
    return id;
  }
}
