part of 'word_details_cubit.dart';

sealed class WordDetailsState extends Equatable {
  const WordDetailsState();

  @override
  List<Object> get props => [];
}

final class WordDetailsInitial extends WordDetailsState {}

final class WordDetailsLoading extends WordDetailsState {}

final class WordDetailsLoaded extends WordDetailsState {
  final WordDetailsDto wordDetails;

  const WordDetailsLoaded(this.wordDetails);

  @override
  List<Object> get props => [wordDetails];
}

final class WordDetailsError extends WordDetailsState {
  final String message;

  const WordDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
