import 'package:dicionario_mobile/domain/entities/antonyms_entity.dart';
import 'package:dicionario_mobile/domain/entities/synonyms_entity.dart';

class DefinitionEntity {
  final String definition;
  final String example;
  final SynonymsEntity synonyms;
  final AntonymsEntity antonyms;

  DefinitionEntity({
    required this.definition,
    required this.example,
    required this.synonyms,
    required this.antonyms,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DefinitionEntity &&
        other.definition == definition &&
        other.example == example &&
        other.synonyms == synonyms &&
        other.antonyms == antonyms;
  }

  @override
  int get hashCode {
    return definition.hashCode ^
        example.hashCode ^
        synonyms.hashCode ^
        antonyms.hashCode;
  }
}
