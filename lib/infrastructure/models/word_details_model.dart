import 'dart:convert';

import 'package:dicionario_mobile/application/dtos/word_details_dto.dart';
import 'package:dicionario_mobile/infrastructure/models/meanings_model.dart';
import 'package:dicionario_mobile/infrastructure/models/phonetics_model.dart';

class WordDetailsModel {
  final String word;
  final String? phonetic;
  final PhoneticsModel phonetics;
  final String? origin;
  final MeaningsModel meanings;

  WordDetailsModel({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.origin,
    required this.meanings,
  });

  factory WordDetailsModel.fromMap(Map<String, dynamic> json) {
    return WordDetailsModel(
      word: json['word'],
      phonetic: json['phonetic'],
      phonetics: json['phonetics'] is List
          ? PhoneticsModel.fromList(json['phonetics'])
          : PhoneticsModel.fromMap(json['phonetics']),
      origin: json['origin'] ?? '',
      meanings: json['meanings'] is List
          ? MeaningsModel.fromList(json['meanings'])
          : MeaningsModel.fromMap(json['meanings']),
    );
  }

  factory WordDetailsModel.fromDto(WordDetailsDto dto) {
    return WordDetailsModel(
      word: dto.word,
      phonetic: dto.phonetic,
      phonetics: PhoneticsModel.fromDto(dto.phonetics),
      origin: dto.origin,
      meanings: MeaningsModel.fromDto(dto.meanings),
    );
  }

  factory WordDetailsModel.fromList(List<dynamic> list) {
    return WordDetailsModel.fromMap(list.first);
  }

  factory WordDetailsModel.fromJson(String source) =>
      WordDetailsModel.fromList(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'phonetic': phonetic,
      'phonetics': phonetics.toList(),
      'origin': origin,
      'meanings': meanings.toList(),
    };
  }

  String toJson() => json.encode(toMap());

  WordDetailsDto toDto() {
    return WordDetailsDto(
      word: word,
      phonetic: phonetic ?? '',
      phonetics: phonetics.toDto(),
      origin: origin ?? '',
      meanings: meanings.toDto(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordDetailsModel &&
        other.word == word &&
        other.phonetic == phonetic &&
        other.phonetics == phonetics &&
        other.origin == origin &&
        other.meanings == meanings;
  }

  @override
  int get hashCode {
    return word.hashCode ^
        phonetic.hashCode ^
        phonetics.hashCode ^
        origin.hashCode ^
        meanings.hashCode;
  }
}
