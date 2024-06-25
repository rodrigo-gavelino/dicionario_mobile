import 'package:dicionario_mobile/domain/entities/meanings_entity.dart';
import 'package:dicionario_mobile/domain/entities/phonetics_entity.dart';

class WordDetailsEntity {
  final String word;
  final String phonetic;
  final PhoneticsEntity phonetics;
  final String origin;
  final MeaningsEntity meanings;

  WordDetailsEntity({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.origin,
    required this.meanings,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordDetailsEntity &&
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
