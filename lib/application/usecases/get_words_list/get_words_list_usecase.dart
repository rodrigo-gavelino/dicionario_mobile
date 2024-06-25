import 'package:dicionario_mobile/@core/errors/failures.dart';
import 'package:dicionario_mobile/@core/utils/either.dart';
import 'package:dicionario_mobile/application/dtos/words_dto.dart';

abstract interface class GetWordsListUsecase {
  Future<Either<Failures, WordsDto>> call();
}
