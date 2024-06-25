import 'package:dicionario_mobile/infrastructure/models/word_details_model.dart';

abstract interface class GetLocalWordDetailsDatasource {
  Future<WordDetailsModel> call(String word);
}
