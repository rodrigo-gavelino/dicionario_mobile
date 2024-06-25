import 'package:dicionario_mobile/@core/errors/exceptions.dart';
import 'package:dicionario_mobile/@core/externals/cache/cache_adapter.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_word_details/local/get_local_word_details_datasource.dart';
import 'package:dicionario_mobile/infrastructure/models/word_details_model.dart';

class GetLocalWordDetailsDatasourceImpl
    implements GetLocalWordDetailsDatasource {
  final CacheAdapter _cacheAdapter;

  GetLocalWordDetailsDatasourceImpl({
    required CacheAdapter cacheAdapter,
  }) : _cacheAdapter = cacheAdapter;

  @override
  Future<WordDetailsModel> call(String word) async {
    try {
      final response = await _cacheAdapter.get(key: word);
      if (response == null) {
        throw const LocalDataSourceException(
            message: 'Erro ao buscar detalhes da palavra');
      }

      return WordDetailsModel.fromJson(response);
    } on LocalDataSourceException catch (e) {
      throw LocalDataSourceException(message: e.message);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
