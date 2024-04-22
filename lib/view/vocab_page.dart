import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:vocab_card/model/title_type.dart';
import 'package:vocab_card/view/item_widget.dart';
import 'package:vocab_card/view/word_class_tag.dart';

import '../model/vocabulary.dart';

class VocabPage extends StatelessWidget {
  const VocabPage(this.index, this.vocabList, {super.key});
  final int index;
  final List<Vocabulary> vocabList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Swiper(
          index: index,
          scrollDirection: Axis.vertical,
          itemCount: vocabList.length,
          itemBuilder: (context, index) {
            final vocab = vocabList[index];
            return Container(
              padding: const EdgeInsets.all(20),
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
                  const Spacer(),
                  Text(vocab.russian,
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            );
          },
        ));
  }
}
