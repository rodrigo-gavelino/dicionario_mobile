import 'package:dicionario_mobile/@core/errors/failures.dart';
import 'package:dicionario_mobile/@core/utils/either.dart';
import 'package:dicionario_mobile/domain/entities/word_details_entity.dart';
import 'package:dicionario_mobile/domain/entities/words_entity.dart';

abstract interface class WordsRepository {
  Future<Either<Failures, WordsEntity>> getAllWords();
  Future<Either<Failures, WordDetailsEntity>> getWordDetails({
    required String word,
  });
}
