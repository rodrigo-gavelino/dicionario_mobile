import 'package:dicionario_mobile/domain/entities/definitions_entity.dart';
import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/application/dtos/definition_dto.dart';

class DefinitionsDto {
  final List<DefinitionDto> definitions;

  DefinitionsDto({required this.definitions});

  factory DefinitionsDto.fromDomain(DefinitionsEntity definitions) {
    return DefinitionsDto(
        definitions: definitions.definitions
            .map((e) => DefinitionDto.fromDomain(e))
            .toList());
  }

  DefinitionsEntity toDomain() {
    return DefinitionsEntity(
        definitions: definitions.map((e) => e.toDomain()).toList());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DefinitionsDto &&
        listEquals(other.definitions, definitions);
  }

  @override
  int get hashCode => definitions.hashCode;
}
