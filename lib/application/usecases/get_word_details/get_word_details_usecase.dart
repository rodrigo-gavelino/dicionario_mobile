import 'package:dicionario_mobile/@core/errors/failures.dart';
import 'package:dicionario_mobile/@core/utils/either.dart';
import 'package:dicionario_mobile/application/dtos/word_details_dto.dart';

abstract interface class GetWordDetailsUsecase {
  Future<Either<Failures, WordDetailsDto>> call({
    required String word,
  });
}
