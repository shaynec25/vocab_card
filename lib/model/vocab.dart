class Vocab {
  String index;
  String english, wordClass, description, chinese, example, russian;

  Vocab(this.index, this.english, this.wordClass, this.description,
      this.chinese, this.example, this.russian);

  factory Vocab.fromJson(dynamic json) {
    return Vocab(json['index'].toString(), json['english'], json['wordClass'],
        json['description'], json['chinese'], json['example'], json['russian']);
  }

  Map toJson() => {
        'index': index,
        'english': english,
        'wordClass': wordClass,
        'description': description,
        'chinese': chinese,
        'example': example,
        'russian': russian,
      };
}
