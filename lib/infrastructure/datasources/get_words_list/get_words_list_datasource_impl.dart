import 'package:dicionario_mobile/@core/errors/exceptions.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_words_list/get_words_list_datasource.dart';
import 'package:dicionario_mobile/infrastructure/models/words_model.dart';
import 'package:flutter/services.dart';

class GetWordsListDatasourceImpl implements GetWordsListDatasource {
  @override
  Future<WordsModel> call() async {
    try {
      final wordsList =
          await rootBundle.loadString('assets/data/words_dictionary.json');
      return WordsModel.fromJson(wordsList);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
