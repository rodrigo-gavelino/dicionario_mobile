import 'package:dicionario_mobile/domain/entities/synonyms_entity.dart';
import 'package:flutter/foundation.dart';

class SynonymsDto {
  final List<String?>? synonyms;

  SynonymsDto({required this.synonyms});

  factory SynonymsDto.fromDomain(SynonymsEntity synonyms) {
    return SynonymsDto(synonyms: synonyms.synonyms);
  }

  SynonymsEntity toDomain() {
    return SynonymsEntity(synonyms: synonyms);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SynonymsDto && listEquals(other.synonyms, synonyms);
  }

  @override
  int get hashCode => synonyms.hashCode;
}
