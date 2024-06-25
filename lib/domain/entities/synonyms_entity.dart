import 'package:flutter/foundation.dart';

class SynonymsEntity {
  final List<String?>? synonyms;

  SynonymsEntity({required this.synonyms});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SynonymsEntity && listEquals(other.synonyms, synonyms);
  }

  @override
  int get hashCode => synonyms.hashCode;
}
