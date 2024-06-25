abstract interface class CacheAdapter {
  Future<String?> get({required String key});
  Future<void> set({required String key, required dynamic value});
  Future<void> remove(String key);
  Future<void> clear();
}
