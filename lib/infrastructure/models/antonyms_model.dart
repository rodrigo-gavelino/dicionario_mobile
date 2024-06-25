import 'package:dicionario_mobile/application/dtos/antonyms_dto.dart';
import 'package:flutter/foundation.dart';

class AntonymsModel {
  final List<String?>? antonyms;

  AntonymsModel({required this.antonyms});

  factory AntonymsModel.fromList(List<dynamic> list) {
    return AntonymsModel(
      antonyms: list.map((e) => e as String?).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'antonyms': antonyms,
    };
  }

  factory AntonymsModel.fromDto(AntonymsDto dto) {
    return AntonymsModel(
      antonyms: dto.antonyms,
    );
  }

  AntonymsDto toDto() {
    return AntonymsDto(
      antonyms: antonyms,
    );
  }

  List<dynamic> toList() {
    return [
      {
        'antonyms': antonyms,
      }
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AntonymsModel && listEquals(other.antonyms, antonyms);
  }

  @override
  int get hashCode => antonyms.hashCode;
}
