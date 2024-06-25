import 'package:dicionario_mobile/domain/entities/word_entity.dart';

class WordDto {
  final String word;

  WordDto({required this.word});

  factory WordDto.fromDomain(String word) {
    return WordDto(word: word);
  }

  WordEntity toDomain() {
    return WordEntity(word: word);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordDto && other.word == word;
  }

  @override
  int get hashCode => word.hashCode;
}
