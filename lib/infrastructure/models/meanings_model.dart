import 'package:dicionario_mobile/application/dtos/meanings_dto.dart';
import 'package:flutter/foundation.dart';

import 'package:dicionario_mobile/infrastructure/models/meaning_model.dart';

class MeaningsModel {
  final List<MeaningModel> definitions;

  MeaningsModel({required this.definitions});

  factory MeaningsModel.fromList(List<dynamic> list) {
    return MeaningsModel(
      definitions: list.map((e) => MeaningModel.fromMap(e)).toList(),
    );
  }

  factory MeaningsModel.fromMap(Map<String, dynamic> json) {
    return MeaningsModel(
      definitions: json['definitions'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'definitions': definitions.map((e) => e.toMap()).toList(),
    };
  }

  List<dynamic> toList() {
    return [
      {
        'definitions': definitions.map((e) => e.toList()).toList(),
      }
    ];
  }

  factory MeaningsModel.fromDto(MeaningsDto dto) {
    return MeaningsModel(
      definitions: dto.meanings.map((e) => MeaningModel.fromDto(e)).toList(),
    );
  }

  MeaningsDto toDto() {
    return MeaningsDto(
      meanings: definitions.map((e) => e.toDto()).toList(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeaningsModel && listEquals(other.definitions, definitions);
  }

  @override
  int get hashCode => definitions.hashCode;
}
