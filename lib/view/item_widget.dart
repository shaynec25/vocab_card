import 'package:flutter/material.dart';
import 'package:vocab_card/model/title_type.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({super.key, required this.type, required this.content});
  String content;
  TitleType type;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        content,
        style: textStyleByType(),
      ),
    );
  }

  TextStyle textStyleByType() {
    switch (type) {
      case TitleType.description:
        return TextStyle(fontStyle: FontStyle.italic);
        break;
      default:
        return TextStyle();
    }
  }
}
