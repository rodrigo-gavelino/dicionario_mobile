import 'package:dicionario_mobile/application/dtos/definitions_dto.dart';
import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/infrastructure/models/definition_model.dart';

class DefinitionsModel {
  final List<DefinitionModel> definitions;

  DefinitionsModel({required this.definitions});

  factory DefinitionsModel.fromList(List<dynamic> list) {
    return DefinitionsModel(
      definitions: list.map((e) => DefinitionModel.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'definitions': definitions.map((e) => e.toMap()).toList(),
    };
  }

  factory DefinitionsModel.fromDto(DefinitionsDto dto) {
    return DefinitionsModel(
      definitions:
          dto.definitions.map((e) => DefinitionModel.fromDto(e)).toList(),
    );
  }

  List<dynamic> toList() {
    return [
      {
        'definitions': definitions.map((e) => e.toList()).toList(),
      }
    ];
  }

  DefinitionsDto toDto() {
    return DefinitionsDto(
      definitions: definitions.map((e) => e.toDto()).toList(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DefinitionsModel &&
        listEquals(other.definitions, definitions);
  }

  @override
  int get hashCode => definitions.hashCode;
}
