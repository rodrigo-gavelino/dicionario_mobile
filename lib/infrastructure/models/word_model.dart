import 'package:dicionario_mobile/application/dtos/word_dto.dart';

class WordModel {
  final String word;

  WordModel({
    required this.word,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordModel && other.word == word;
  }

  @override
  int get hashCode => word.hashCode;

  WordDto toDto() {
    return WordDto(word: word);
  }
}
