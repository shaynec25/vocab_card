import 'package:flutter/material.dart';
import 'package:vocab_card/controller/data_controller.dart';

import 'model/vocab.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Vocab> vocabList = [];
  @override
  void initState() {
    // TODO: implement initState
    DataController().getVocabList().then((value) {
      setState(() {
        vocabList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: ListView.builder(
                itemCount: vocabList.length,
                itemBuilder: (context, index) {
                  return vocabList.isEmpty
                      ? ListTile(
                          title: Text('loading'),
                        )
                      : ListTile(
                          title: Text(vocabList[index].english),
                        );
                })));
  }
}
