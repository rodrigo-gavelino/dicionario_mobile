import 'package:dicionario_mobile/application/dtos/antonyms_dto.dart';
import 'package:dicionario_mobile/application/dtos/synonyms_dto.dart';
import 'package:dicionario_mobile/domain/entities/definition_entity.dart';

class DefinitionDto {
  final String definition;
  final String example;
  final SynonymsDto synonyms;
  final AntonymsDto antonyms;

  DefinitionDto({
    required this.definition,
    required this.example,
    required this.synonyms,
    required this.antonyms,
  });

  factory DefinitionDto.fromDomain(DefinitionEntity definitionEntity) {
    return DefinitionDto(
      definition: definitionEntity.definition,
      example: definitionEntity.example,
      synonyms: SynonymsDto.fromDomain(definitionEntity.synonyms),
      antonyms: AntonymsDto.fromDomain(definitionEntity.antonyms),
    );
  }

  DefinitionEntity toDomain() {
    return DefinitionEntity(
      definition: definition,
      example: example,
      synonyms: synonyms.toDomain(),
      antonyms: antonyms.toDomain(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DefinitionDto &&
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
