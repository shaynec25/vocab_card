import 'package:flutter/material.dart';
import 'package:vocab_card/view/loading_popup.dart';

import '../controller/data_controller.dart';
import '../model/vocab.dart';

class CreateNewDialog extends StatefulWidget {
  const CreateNewDialog({super.key});

  @override
  State<CreateNewDialog> createState() => _CreateNewDialogState();
}

List<String> list = <String>['noun', 'adv', 'adj', 'verb'];

class _CreateNewDialogState extends State<CreateNewDialog> {
  TextEditingController englishCtl = TextEditingController();
  TextEditingController desCtl = TextEditingController();
  TextEditingController chCtl = TextEditingController();
  TextEditingController exampleCtl = TextEditingController();
  TextEditingController ruCtl = TextEditingController();

  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create a New Vocabulary'),
      content: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextField(
              controller: englishCtl,
              decoration: const InputDecoration(hintText: 'English'),
            ),
            DropdownButton(
              value: dropdownValue,
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                print(value);
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
            TextField(
              controller: desCtl,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            TextField(
              controller: chCtl,
              decoration: const InputDecoration(hintText: 'Chinese'),
            ),
            TextField(
              controller: exampleCtl,
              decoration: const InputDecoration(hintText: 'Example'),
            ),
            TextField(
              controller: ruCtl,
              decoration: const InputDecoration(hintText: 'Russian'),
            ),
          ]),
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Create'),
          onPressed: () async {
            showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  DataController()
                      .createNew(Vocab('0', englishCtl.text, dropdownValue,
                          desCtl.text, chCtl.text, exampleCtl.text, ruCtl.text))
                      .then((value) {
                    //TODO: upload failed handle
                    Navigator.of(context).pop();
                  });
                  return LoadingPopup(
                    msg: 'uploading...',
                  );
                }).then((value) => Navigator.of(context).pop());
          },
        ),
      ],
    );
  }
}
