import 'package:bloc/bloc.dart';
import 'package:dicionario_mobile/application/dtos/words_dto.dart';
import 'package:dicionario_mobile/application/usecases/get_words_list/get_words_list_usecase.dart';
import 'package:equatable/equatable.dart';

part 'words_state.dart';

class WordsCubit extends Cubit<WordsState> {
  final GetWordsListUsecase _getWordsListUsecase;
  WordsCubit({required GetWordsListUsecase getWordsListUsecase})
      : _getWordsListUsecase = getWordsListUsecase,
        super(WordsInitialState());

  Future<void> getWordsList() async {
    emit(WordsLoadingState());
    final result = await _getWordsListUsecase();
    result.fold(
      (failure) => emit(WordsErrorState(failure.message)),
      (success) => emit(WordsLoadedState(success)),
    );
  }
}
