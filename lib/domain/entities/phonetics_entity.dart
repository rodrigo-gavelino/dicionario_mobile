import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/domain/entities/phonetic_entity.dart';

class PhoneticsEntity {
  final List<PhoneticEntity> phonetics;

  PhoneticsEntity({required this.phonetics});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhoneticsEntity && listEquals(other.phonetics, phonetics);
  }

  @override
  int get hashCode => phonetics.hashCode;
}
