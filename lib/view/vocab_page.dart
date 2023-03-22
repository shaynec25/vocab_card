import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:vocab_card/model/title_type.dart';
import 'package:vocab_card/view/item_widget.dart';
import 'package:vocab_card/view/wordclass_tag.dart';

import '../model/vocab.dart';

class VocabPgae extends StatefulWidget {
  VocabPgae(this.index, this.vocabList);
  final int index;
  final List<Vocab> vocabList;

  @override
  State<VocabPgae> createState() => _VocabPgaeState();
}

class _VocabPgaeState extends State<VocabPgae> {
  @override
  Widget build(BuildContext context) {
    // final Vocab vocab = widget.vocab;
    return Scaffold(
        appBar: AppBar(),
        body: Swiper(
          index: widget.index,
          scrollDirection: Axis.vertical,
          itemCount: widget.vocabList.length,
          itemBuilder: (context, index) {
            final vocab = widget.vocabList[index];
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vocab.english,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  WordClassTag(type: vocab.wordClass),
                  const Divider(),
                  ItemWidget(type: TitleType.chinese, content: vocab.chinese),
                  const Divider(),
                  ItemWidget(
                      type: TitleType.description, content: vocab.description),
                  const Divider(),
                  ItemWidget(type: TitleType.example, content: vocab.example),
                  Spacer(),
                  Text(vocab.russian,
                      style: Theme.of(context).textTheme.headline5),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            );
          },
        ));
  }
}