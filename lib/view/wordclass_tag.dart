import 'package:flutter/material.dart';

class WordClassTag extends StatelessWidget {
  WordClassTag({super.key, required this.type});
  String type;
  @override
  Widget build(BuildContext context) {
    late Color color;
    switch (type) {
      case 'noun':
        color = Colors.amber[700]!;
        break;
      case 'adj':
        color = Colors.lightGreen[700]!;
        break;
      case 'adv':
        color = Colors.blue[700]!;
        break;
      case 'verb':
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
        type,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
