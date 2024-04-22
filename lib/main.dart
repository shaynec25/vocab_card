import 'package:flutter/material.dart';
import 'package:vocab_card/controller/data_controller.dart';
import 'package:vocab_card/view/create_dialog.dart';
import 'package:vocab_card/view/loading_popup.dart';
import 'package:vocab_card/view/loading_view.dart';
import 'package:vocab_card/view/vocab_page.dart';

import 'model/vocabulary.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Vocabulary Card',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Vocabulary> vocabList = [];
  DataController dataController = DataController();
  @override
  void initState() {
    // to load data
    dataController.getVocabList().then(
      (value) {
        setState(() {
          vocabList = value;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Vocabulary Card'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const CreateNewDialog();
                    }).then(
                  (value) {
                    showDialog<void>(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        dataController.getVocabList().then(
                          (value) {
                            Navigator.of(context).pop();
                            setState(() {
                              vocabList = value;
                            });
                          },
                        );
                        return const LoadingPopup(
                          msg: 'reloading...',
                        );
                      },
                    );
                  },
                );
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
                final Vocabulary vocab = vocabList[index];
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VocabPage(index, vocabList),
                    ),
                  ),
                  child: ListTile(
                    title: Text(vocab.english),
                  ),
                );
              },
            ),
    );
  }
}
