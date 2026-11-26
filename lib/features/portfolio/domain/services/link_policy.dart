enum LinkTarget { sameTab, newTab }

/// Where [url] should open, or null if it is still a `[placeholder]`.
LinkTarget? linkTargetFor(String url) {
  if (url.startsWith('[')) return null;
  final scheme = Uri.parse(url).scheme;
  return scheme == 'mailto' || scheme == 'tel'
      ? LinkTarget.sameTab
      : LinkTarget.newTab;
}
