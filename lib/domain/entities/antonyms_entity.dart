import 'package:flutter/foundation.dart';

class AntonymsEntity {
  final List<String?>? antonyms;

  AntonymsEntity({required this.antonyms});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AntonymsEntity && listEquals(other.antonyms, antonyms);
  }

  @override
  int get hashCode => antonyms.hashCode;
}
