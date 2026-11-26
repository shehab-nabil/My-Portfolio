abstract interface class AssetResolver {
  /// Path of the image called [name] inside [dir], or null if not added yet.
  String? find(String dir, String name);
}
