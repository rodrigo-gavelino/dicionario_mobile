import 'dart:convert';

import 'package:dicionario_mobile/application/dtos/words_dto.dart';
import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/infrastructure/models/word_model.dart';

class WordsModel {
  final List<WordModel> words;

  WordsModel({
    required this.words,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordsModel && listEquals(other.words, words);
  }

  @override
  int get hashCode => words.hashCode;

  factory WordsModel.fromMap(Map<String, dynamic> map) {
    return WordsModel(
      words: map.entries.map((e) => WordModel(word: e.key)).toList(),
    );
  }

  factory WordsModel.fromJson(String source) =>
      WordsModel.fromMap(json.decode(source));

  WordsDto toDto() {
    return WordsDto(words: words.map((e) => e.toDto()).toList());
  }
}
