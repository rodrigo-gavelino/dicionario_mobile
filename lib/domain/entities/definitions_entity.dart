import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/domain/entities/definition_entity.dart';

class DefinitionsEntity {
  final List<DefinitionEntity> definitions;

  DefinitionsEntity({required this.definitions});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DefinitionsEntity &&
        listEquals(other.definitions, definitions);
  }

  @override
  int get hashCode => definitions.hashCode;
}
