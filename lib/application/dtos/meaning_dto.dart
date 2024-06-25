import 'package:dicionario_mobile/application/dtos/definitions_dto.dart';
import 'package:dicionario_mobile/domain/entities/meaning_entity.dart';

class MeaningDto {
  final String partOfSpeech;
  final DefinitionsDto definitions;

  MeaningDto({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory MeaningDto.fromDomain(MeaningEntity meaningEntity) {
    return MeaningDto(
      partOfSpeech: meaningEntity.partOfSpeech,
      definitions: DefinitionsDto.fromDomain(meaningEntity.definitions),
    );
  }

  MeaningEntity toDomain() {
    return MeaningEntity(
      partOfSpeech: partOfSpeech,
      definitions: definitions.toDomain(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeaningDto &&
        other.partOfSpeech == partOfSpeech &&
        other.definitions == definitions;
  }

  @override
  int get hashCode => partOfSpeech.hashCode ^ definitions.hashCode;
}
