import 'package:dicionario_mobile/application/dtos/phonetic_dto.dart';

class PhoneticModel {
  final String? text;
  final String? audio;

  PhoneticModel({required this.text, required this.audio});

  factory PhoneticModel.fromMap(Map<String, dynamic> json) {
    return PhoneticModel(
      text: json['text'],
      audio: json['audio'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'audio': audio,
    };
  }

  factory PhoneticModel.fromDto(PhoneticDto dto) {
    return PhoneticModel(
      text: dto.text,
      audio: dto.audio,
    );
  }

  PhoneticDto toDto() {
    return PhoneticDto(
      text: text!,
      audio: audio!,
    );
  }

  List<dynamic> toList() {
    return [
      {
        'text': text,
        'audio': audio,
      }
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhoneticModel && other.text == text && other.audio == audio;
  }

  @override
  int get hashCode => text.hashCode ^ audio.hashCode;
}
