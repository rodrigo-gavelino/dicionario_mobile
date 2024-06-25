import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/domain/entities/meaning_entity.dart';

class MeaningsEntity {
  final List<MeaningEntity> meanings;

  MeaningsEntity({required this.meanings});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeaningsEntity && listEquals(other.meanings, meanings);
  }

  @override
  int get hashCode => meanings.hashCode;
}
