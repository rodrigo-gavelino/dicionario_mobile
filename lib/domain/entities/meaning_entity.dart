import 'package:dicionario_mobile/domain/entities/definitions_entity.dart';

class MeaningEntity {
  final String partOfSpeech;
  final DefinitionsEntity definitions;

  MeaningEntity({
    required this.partOfSpeech,
    required this.definitions,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeaningEntity &&
        other.partOfSpeech == partOfSpeech &&
        other.definitions == definitions;
  }

  @override
  int get hashCode => partOfSpeech.hashCode ^ definitions.hashCode;
}
