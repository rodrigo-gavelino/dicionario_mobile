import 'package:dicionario_mobile/domain/entities/phonetic_entity.dart';

class PhoneticDto {
  final String text;
  final String audio;

  PhoneticDto({required this.text, required this.audio});

  factory PhoneticDto.fromDomain(PhoneticEntity phoneticEntity) {
    return PhoneticDto(text: phoneticEntity.text, audio: phoneticEntity.audio);
  }

  PhoneticEntity toDomain() {
    return PhoneticEntity(text: text, audio: audio);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhoneticDto && other.text == text && other.audio == audio;
  }

  @override
  int get hashCode => text.hashCode ^ audio.hashCode;
}
