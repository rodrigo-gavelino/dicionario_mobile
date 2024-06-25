import 'package:dicionario_mobile/application/dtos/definition_dto.dart';
import 'package:dicionario_mobile/infrastructure/models/antonyms_model.dart';
import 'package:dicionario_mobile/infrastructure/models/synonyms_model.dart';

class DefinitionModel {
  final String? definition;
  final String? example;
  final SynonymsModel synonyms;
  final AntonymsModel antonyms;

  DefinitionModel({
    required this.definition,
    required this.example,
    required this.synonyms,
    required this.antonyms,
  });

  factory DefinitionModel.fromMap(Map<String, dynamic> json) {
    return DefinitionModel(
      definition: json['definition'] ?? '',
      example: json['example'] ?? '',
      synonyms: SynonymsModel.fromList(json['synonyms']),
      antonyms: AntonymsModel.fromList(json['antonyms']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'definition': definition,
      'example': example,
      'synonyms': synonyms.toMap(),
      'antonyms': antonyms.toMap(),
    };
  }

  factory DefinitionModel.fromDto(DefinitionDto dto) {
    return DefinitionModel(
      definition: dto.definition,
      example: dto.example,
      synonyms: SynonymsModel.fromDto(dto.synonyms),
      antonyms: AntonymsModel.fromDto(dto.antonyms),
    );
  }

  List<dynamic> toList() {
    return [
      {
        'definition': definition,
        'example': example,
        'synonyms': synonyms.toList(),
        'antonyms': antonyms.toList(),
      }
    ];
  }

  DefinitionDto toDto() {
    return DefinitionDto(
      definition: definition!,
      example: example!,
      synonyms: synonyms.toDto(),
      antonyms: antonyms.toDto(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DefinitionModel &&
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
