import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/domain/entities/word_entity.dart';

class WordsEntity {
  final List<WordEntity> words;

  WordsEntity({required this.words});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordsEntity && listEquals(other.words, words);
  }

  @override
  int get hashCode => words.hashCode;
}
