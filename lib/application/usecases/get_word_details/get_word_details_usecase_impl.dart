import 'package:dicionario_mobile/@core/errors/failures.dart';
import 'package:dicionario_mobile/@core/utils/either.dart';
import 'package:dicionario_mobile/application/dtos/word_details_dto.dart';
import 'package:dicionario_mobile/application/usecases/get_word_details/get_word_details_usecase.dart';
import 'package:dicionario_mobile/domain/repositories/words_repository.dart';

class GetWordDetailsUsecaseImpl implements GetWordDetailsUsecase {
  final WordsRepository _wordsRepository;

  GetWordDetailsUsecaseImpl({
    required WordsRepository wordsRepository,
  }) : _wordsRepository = wordsRepository;

  @override
  Future<Either<Failures, WordDetailsDto>> call({required String word}) async {
    final result = await _wordsRepository.getWordDetails(word: word);
    return result.fold(
      (failure) => Left(CacheFailure(failure.message)),
      (suceess) => Right(WordDetailsDto.fromDomain(suceess)),
    );
  }
}
