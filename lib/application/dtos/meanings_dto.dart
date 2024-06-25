import 'package:dicionario_mobile/domain/entities/meanings_entity.dart';
import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/application/dtos/meaning_dto.dart';

class MeaningsDto {
  final List<MeaningDto> meanings;

  MeaningsDto({required this.meanings});

  factory MeaningsDto.fromDomain(MeaningsEntity meaningsEntity) {
    return MeaningsDto(
      meanings:
          meaningsEntity.meanings.map((e) => MeaningDto.fromDomain(e)).toList(),
    );
  }

  MeaningsEntity toDomain() {
    return MeaningsEntity(
      meanings: meanings.map((e) => e.toDomain()).toList(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeaningsDto && listEquals(other.meanings, meanings);
  }

  @override
  int get hashCode => meanings.hashCode;
}
