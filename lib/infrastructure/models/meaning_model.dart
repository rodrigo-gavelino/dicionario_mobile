import 'package:dicionario_mobile/application/dtos/meaning_dto.dart';
import 'package:dicionario_mobile/infrastructure/models/definitions_model.dart';

class MeaningModel {
  final String partOfSpeech;
  final DefinitionsModel definitions;

  MeaningModel({required this.partOfSpeech, required this.definitions});

  factory MeaningModel.fromMap(Map<String, dynamic> json) {
    return MeaningModel(
      partOfSpeech: json['partOfSpeech'],
      definitions: DefinitionsModel.fromList(json['definitions']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'partOfSpeech': partOfSpeech,
      'definitions': definitions.toMap(),
    };
  }

  factory MeaningModel.fromDto(MeaningDto dto) {
    return MeaningModel(
      partOfSpeech: dto.partOfSpeech,
      definitions: DefinitionsModel.fromDto(dto.definitions),
    );
  }

  List<dynamic> toList() {
    return [
      {
        'partOfSpeech': partOfSpeech,
        'definitions': definitions.toList(),
      }
    ];
  }

  MeaningDto toDto() {
    return MeaningDto(
      partOfSpeech: partOfSpeech,
      definitions: definitions.toDto(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeaningModel &&
        other.partOfSpeech == partOfSpeech &&
        other.definitions == definitions;
  }

  @override
  int get hashCode => partOfSpeech.hashCode ^ definitions.hashCode;
}
