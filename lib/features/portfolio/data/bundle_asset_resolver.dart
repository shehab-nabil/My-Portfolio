import 'package:flutter/services.dart';

import 'package:my_portfolio/features/portfolio/domain/services/asset_resolver.dart';

/// Reads the asset manifest once, so missing images show a placeholder without
/// triggering failed network requests.
class BundleAssetResolver implements AssetResolver {
  const BundleAssetResolver(this._assets);

  static const _extensions = ['png', 'jpg', 'jpeg', 'webp'];

  final Set<String> _assets;

  static Future<BundleAssetResolver> load() async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    return BundleAssetResolver(manifest.listAssets().toSet());
  }

  @override
  String? find(String dir, String name) {
    for (final extension in _extensions) {
      final path = '$dir$name.$extension';
      if (_assets.contains(path)) return path;
    }
    return null;
  }
}
