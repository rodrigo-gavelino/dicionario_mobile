import 'package:dicionario_mobile/domain/entities/words_entity.dart';
import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/application/dtos/word_dto.dart';

class WordsDto {
  final List<WordDto> words;

  WordsDto({required this.words});

  factory WordsDto.fromDomain(WordsEntity wordsEntity) {
    return WordsDto(
      words: wordsEntity.words.map((e) => WordDto.fromDomain(e.word)).toList(),
    );
  }

  WordsEntity toDomain() {
    return WordsEntity(words: words.map((e) => e.toDomain()).toList());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordsDto && listEquals(other.words, words);
  }

  @override
  int get hashCode => words.hashCode;
}
