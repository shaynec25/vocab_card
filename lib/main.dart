import 'package:flutter/material.dart';
import 'package:vocab_card/controller/data_controller.dart';
import 'package:vocab_card/view/loading_view.dart';
import 'package:vocab_card/view/vocab_page.dart';

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
    // to load data
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
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      // TODO: create a new data
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            body: vocabList.isEmpty
                ? const LoadingView()
                : ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: vocabList.length,
                    itemBuilder: (context, index) {
                      final Vocab vocab = vocabList[index];
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    VocabPgae(index, vocabList))),
                        child: ListTile(
                          title: Text(vocab.english),
                        ),
                      );
                    })));
  }
}
