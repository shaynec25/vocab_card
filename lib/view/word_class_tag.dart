import 'package:flutter/material.dart';
import 'package:vocab_card/model/word_class.dart';

class WordClassTag extends StatelessWidget {
  const WordClassTag({super.key, required this.type});
  final WordClass type;
  @override
  Widget build(BuildContext context) {
    late Color color;
    switch (type) {
      case WordClass.noun:
        color = Colors.amber[700]!;
        break;
      case WordClass.adj:
        color = Colors.lightGreen[700]!;
        break;
      case WordClass.adv:
        color = Colors.blue[700]!;
        break;
      case WordClass.verb:
        color = Colors.red[700]!;
        break;
      default:
        color = Colors.amber;
    }
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      padding: const EdgeInsets.all(8),
      child: Text(
        wordClassToString(type),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
