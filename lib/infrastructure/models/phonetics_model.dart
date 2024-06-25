import 'package:dicionario_mobile/application/dtos/phonetics_dto.dart';
import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/infrastructure/models/phonetic_model.dart';

class PhoneticsModel {
  final List<PhoneticModel> phonetics;

  PhoneticsModel({required this.phonetics});

  factory PhoneticsModel.fromList(List<dynamic> list) {
    return PhoneticsModel(
      phonetics: list.map((e) => PhoneticModel.fromMap(e)).toList(),
    );
  }

  factory PhoneticsModel.fromMap(Map<String, dynamic> json) {
    return PhoneticsModel(
      phonetics: json['phonetics'],
    );
  }

  factory PhoneticsModel.fromDto(PhoneticsDto dto) {
    return PhoneticsModel(
      phonetics: dto.phonetics.map((e) => PhoneticModel.fromDto(e)).toList(),
    );
  }

  PhoneticsDto toDto() {
    return PhoneticsDto(
      phonetics: phonetics.map((e) => e.toDto()).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phonetics': phonetics.map((e) => e.toMap()).toList(),
    };
  }

  List<dynamic> toList() {
    return [
      {
        'phonetics': phonetics.map((e) => e.toList()).toList(),
      }
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhoneticsModel && listEquals(other.phonetics, phonetics);
  }

  @override
  int get hashCode => phonetics.hashCode;
}
