import 'package:dicionario_mobile/@core/errors/exceptions.dart';
import 'package:dicionario_mobile/@core/errors/failures.dart';
import 'package:dicionario_mobile/@core/utils/either.dart';
import 'package:dicionario_mobile/domain/entities/word_details_entity.dart';
import 'package:dicionario_mobile/domain/entities/words_entity.dart';
import 'package:dicionario_mobile/domain/repositories/words_repository.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_word_details/local/get_local_word_details_datasource.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_word_details/remote/get_remote_word_details_datasource.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_words_list/get_words_list_datasource.dart';

class WordsRepositoryImpl implements WordsRepository {
  final GetWordsListDatasource _getWordsListDatasource;
  final GetRemoteWordDetailsDatasource _getRemoteWordDetailsDatasource;
  final GetLocalWordDetailsDatasource _getLocalWordDetailsDatasource;

  WordsRepositoryImpl({
    required GetWordsListDatasource getWordsListDatasource,
    required GetRemoteWordDetailsDatasource getRemoteWordDetailsDatasource,
    required GetLocalWordDetailsDatasource getLocalWordDetailsDatasource,
  })  : _getWordsListDatasource = getWordsListDatasource,
        _getRemoteWordDetailsDatasource = getRemoteWordDetailsDatasource,
        _getLocalWordDetailsDatasource = getLocalWordDetailsDatasource;

  @override
  Future<Either<Failures, WordsEntity>> getAllWords() async {
    try {
      final result = await _getWordsListDatasource();
      return Right(result.toDto().toDomain());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failures, WordDetailsEntity>> getWordDetails({
    required String word,
  }) async {
    try {
      final result = await _getLocalWordDetailsDatasource(word);
      return Right(result.toDto().toDomain());
    } on LocalDataSourceException {
      try {
        final result = await _getRemoteWordDetailsDatasource(word);
        return Right(result.toDto().toDomain());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
