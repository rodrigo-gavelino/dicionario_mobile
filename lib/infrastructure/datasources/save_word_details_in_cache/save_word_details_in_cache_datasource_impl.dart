import 'package:dicionario_mobile/@core/errors/exceptions.dart';
import 'package:dicionario_mobile/@core/externals/cache/cache_adapter.dart';
import 'package:dicionario_mobile/infrastructure/datasources/save_word_details_in_cache/save_word_details_in_cache_datasource.dart';
import 'package:dicionario_mobile/infrastructure/models/word_details_model.dart';

class SaveWordDetailsInCacheDatasourceImpl
    implements SaveWordDetailsInCacheDatasource {
  final CacheAdapter _cacheAdapter;

  SaveWordDetailsInCacheDatasourceImpl({
    required CacheAdapter cacheAdapter,
  }) : _cacheAdapter = cacheAdapter;

  @override
  Future<String> call(
      {required String word,
      required WordDetailsModel wordDetailsModel}) async {
    try {
      await _cacheAdapter.set(
          key: word, value: "[${wordDetailsModel.toJson()}]");
      return 'Success';
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
