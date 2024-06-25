import 'package:dicionario_mobile/application/dtos/meanings_dto.dart';
import 'package:dicionario_mobile/application/dtos/phonetics_dto.dart';
import 'package:dicionario_mobile/domain/entities/word_details_entity.dart';

class WordDetailsDto {
  final String word;
  final String phonetic;
  final PhoneticsDto phonetics;
  final String origin;
  final MeaningsDto meanings;

  WordDetailsDto({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.origin,
    required this.meanings,
  });

  factory WordDetailsDto.fromDomain(WordDetailsEntity wordDetailsEntity) {
    return WordDetailsDto(
      word: wordDetailsEntity.word,
      phonetic: wordDetailsEntity.phonetic,
      phonetics: PhoneticsDto.fromDomain(wordDetailsEntity.phonetics),
      origin: wordDetailsEntity.origin,
      meanings: MeaningsDto.fromDomain(wordDetailsEntity.meanings),
    );
  }

  WordDetailsEntity toDomain() {
    return WordDetailsEntity(
      word: word,
      phonetic: phonetic,
      phonetics: phonetics.toDomain(),
      origin: origin,
      meanings: meanings.toDomain(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordDetailsDto &&
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
