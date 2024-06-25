import 'package:dicionario_mobile/@core/errors/exceptions.dart';
import 'package:dicionario_mobile/@core/externals/cache/cache_adapter.dart';
import 'package:dicionario_mobile/@core/externals/client/client_adapter.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_word_details/remote/get_remote_word_details_datasource.dart';
import 'package:dicionario_mobile/infrastructure/models/word_details_model.dart';

class GetRemoteWordDetailsDatasourceImpl
    implements GetRemoteWordDetailsDatasource {
  final ClientAdapter _client;
  final CacheAdapter _cacheAdapter;

  GetRemoteWordDetailsDatasourceImpl({
    required ClientAdapter client,
    required CacheAdapter cacheAdapter,
  })  : _client = client,
        _cacheAdapter = cacheAdapter;

  @override
  Future<WordDetailsModel> call(String word) async {
    try {
      final response = await _client
          .get('https://api.dictionaryapi.dev/api/v2/entries/en/$word');

      if (response.statusCode != 200) {
        _cacheAdapter.set(
            key: word, value: 'Erro ao buscar detalhes da palavra');
        throw const ServerException(
            message: 'Erro ao buscar detalhes da palavra');
      }
      await _cacheAdapter.set(key: word, value: response.body!);
      return WordDetailsModel.fromJson(response.body!);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
