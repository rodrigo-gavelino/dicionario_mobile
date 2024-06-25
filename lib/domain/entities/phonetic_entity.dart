class PhoneticEntity {
  final String text;
  final String audio;

  PhoneticEntity({
    required this.text,
    required this.audio,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhoneticEntity &&
        other.text == text &&
        other.audio == audio;
  }

  @override
  int get hashCode => text.hashCode ^ audio.hashCode;
}
