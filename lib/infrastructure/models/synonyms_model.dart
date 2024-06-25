import 'package:dicionario_mobile/application/dtos/synonyms_dto.dart';
import 'package:flutter/foundation.dart';

class SynonymsModel {
  final List<String?>? synonyms;

  SynonymsModel({required this.synonyms});

  factory SynonymsModel.fromList(List<dynamic> list) {
    return SynonymsModel(
      synonyms: list.map((e) => e as String?).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'synonyms': synonyms,
    };
  }

  factory SynonymsModel.fromDto(SynonymsDto dto) {
    return SynonymsModel(
      synonyms: dto.synonyms,
    );
  }

  SynonymsDto toDto() {
    return SynonymsDto(
      synonyms: synonyms,
    );
  }

  List<dynamic> toList() {
    return [
      {
        'synonyms': synonyms,
      }
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SynonymsModel && listEquals(other.synonyms, synonyms);
  }

  @override
  int get hashCode => synonyms.hashCode;
}
