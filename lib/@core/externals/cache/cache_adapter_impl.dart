import 'package:dicionario_mobile/@core/externals/cache/cache_adapter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheAdapterImpl implements CacheAdapter {
  final FlutterSecureStorage _storage;

  CacheAdapterImpl({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  @override
  Future<void> clear() async {
    return await _storage.deleteAll();
  }

  @override
  Future<String?> get({required String key}) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> remove(String key) async {
    return await _storage.delete(key: key);
  }

  @override
  Future<void> set({required String key, required value}) async {
    return await _storage.write(key: key, value: value);
  }
}
