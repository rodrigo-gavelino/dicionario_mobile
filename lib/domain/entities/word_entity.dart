class WordEntity {
  final String word;

  WordEntity({
    required this.word,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordEntity && other.word == word;
  }

  @override
  int get hashCode => word.hashCode;
}
