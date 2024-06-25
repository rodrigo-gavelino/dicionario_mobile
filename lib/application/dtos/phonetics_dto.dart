import 'package:dicionario_mobile/domain/entities/phonetics_entity.dart';
import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/application/dtos/phonetic_dto.dart';

class PhoneticsDto {
  final List<PhoneticDto> phonetics;

  PhoneticsDto({required this.phonetics});

  factory PhoneticsDto.fromDomain(PhoneticsEntity phoneticsEntity) {
    return PhoneticsDto(
      phonetics: phoneticsEntity.phonetics
          .map((e) => PhoneticDto.fromDomain(e))
          .toList(),
    );
  }

  PhoneticsEntity toDomain() {
    return PhoneticsEntity(
      phonetics: phonetics.map((e) => e.toDomain()).toList(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhoneticsDto && listEquals(other.phonetics, phonetics);
  }

  @override
  int get hashCode => phonetics.hashCode;
}
