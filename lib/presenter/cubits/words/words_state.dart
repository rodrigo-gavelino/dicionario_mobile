part of 'words_cubit.dart';

sealed class WordsState extends Equatable {
  const WordsState();

  @override
  List<Object> get props => [];
}

final class WordsInitialState extends WordsState {}

final class WordsLoadingState extends WordsState {}

final class WordsLoadedState extends WordsState {
  final WordsDto words;

  const WordsLoadedState(this.words);

  @override
  List<Object> get props => [words];
}

final class WordsErrorState extends WordsState {
  final String message;

  const WordsErrorState(this.message);

  @override
  List<Object> get props => [message];
}

final class WordsHistoryState extends WordsState {
  final List<String?>? history;

  const WordsHistoryState(this.history);

  @override
  List<Object> get props => [history!];
}
