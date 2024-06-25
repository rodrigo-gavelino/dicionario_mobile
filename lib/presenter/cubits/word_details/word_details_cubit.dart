import 'package:bloc/bloc.dart';
import 'package:dicionario_mobile/application/dtos/word_details_dto.dart';
import 'package:dicionario_mobile/application/usecases/get_word_details/get_word_details_usecase.dart';
import 'package:equatable/equatable.dart';

part 'word_details_state.dart';

class WordDetailsCubit extends Cubit<WordDetailsState> {
  final GetWordDetailsUsecase _getWordDetailsUsecase;
  WordDetailsCubit({
    required GetWordDetailsUsecase getWordDetailsUsecase,
  })  : _getWordDetailsUsecase = getWordDetailsUsecase,
        super(WordDetailsInitial());

  Future<void> getWordDetails(String word) async {
    emit(WordDetailsLoading());
    final result = await _getWordDetailsUsecase(word: word);
    result.fold(
      (error) => emit(WordDetailsError(error.message)),
      (wordDetails) {
        emit(WordDetailsLoaded(wordDetails));
      },
    );
  }
}
