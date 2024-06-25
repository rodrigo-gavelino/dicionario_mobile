import 'package:dicionario_mobile/@core/errors/failures.dart';
import 'package:dicionario_mobile/@core/utils/either.dart';
import 'package:dicionario_mobile/application/dtos/words_dto.dart';
import 'package:dicionario_mobile/application/usecases/get_words_list/get_words_list_usecase.dart';
import 'package:dicionario_mobile/domain/repositories/words_repository.dart';

class GetWordsListUsecaseImpl implements GetWordsListUsecase {
  final WordsRepository _wordsRepository;

  GetWordsListUsecaseImpl({
    required WordsRepository wordsRepository,
  }) : _wordsRepository = wordsRepository;

  @override
  Future<Either<Failures, WordsDto>> call() async {
    final result = await _wordsRepository.getAllWords();

    return result.fold(
      (failure) => Left(CacheFailure(failure.message)),
      (suceess) => Right(WordsDto.fromDomain(suceess)),
    );
  }
}
