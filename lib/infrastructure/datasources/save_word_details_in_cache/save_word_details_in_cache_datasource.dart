import 'package:dicionario_mobile/infrastructure/models/word_details_model.dart';

abstract interface class SaveWordDetailsInCacheDatasource {
  Future<String> call({
    required String word,
    required WordDetailsModel wordDetailsModel,
  });
}
