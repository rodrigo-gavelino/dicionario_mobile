import 'package:dicionario_mobile/domain/entities/antonyms_entity.dart';
import 'package:flutter/foundation.dart';

class AntonymsDto {
  final List<String?>? antonyms;

  AntonymsDto({required this.antonyms});

  factory AntonymsDto.fromDomain(AntonymsEntity antonyms) {
    return AntonymsDto(antonyms: antonyms.antonyms);
  }

  AntonymsEntity toDomain() {
    return AntonymsEntity(antonyms: antonyms);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AntonymsDto && listEquals(other.antonyms, antonyms);
  }

  @override
  int get hashCode => antonyms.hashCode;
}
