import 'package:my_portfolio/features/portfolio/domain/services/link_launcher.dart';
import 'package:my_portfolio/features/portfolio/domain/services/link_policy.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLinkLauncher implements LinkLauncher {
  const UrlLinkLauncher();

  @override
  Future<void> open(String url) async {
    final target = linkTargetFor(url);
    if (target == null) return;
    // Relative paths (the CV) are resolved by the browser against <base href>.
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: target == LinkTarget.sameTab ? '_self' : '_blank',
    );
  }
}
