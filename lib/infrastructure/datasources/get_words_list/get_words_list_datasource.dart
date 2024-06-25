import 'package:dicionario_mobile/infrastructure/models/words_model.dart';

abstract interface class GetWordsListDatasource {
  Future<WordsModel> call();
}
