import 'package:vocab_card/model/word_class.dart';

class Vocabulary {
  String index, english, description, chinese, example, russian;
  WordClass wordClass;

  Vocabulary(
    this.index,
    this.english,
    this.wordClass,
    this.description,
    this.chinese,
    this.example,
    this.russian,
  );

  factory Vocabulary.fromJson(dynamic json) {
    return Vocabulary(
      json['index'].toString(),
      json['english'],
      toWordClass(json['wordClass']),
      json['description'],
      json['chinese'],
      json['example'],
      json['russian'],
    );
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
