import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vocab_card/model/vocabulary.dart';

class DataController {
  static Uri url = Uri.https('script.google.com',
      'macros/s/AKfycbzff0DhYWVeMCeaAE1rp4vHY56xlVKBKBxVbZX7pWVhY7CUqTgZRfHtyl83ddYc4tWjFA/exec');

  Future<List<Vocabulary>> getVocabList() async {
    return await http.get(url).then((response) {
      var jsonFeedback = jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => Vocabulary.fromJson(json)).toList();
    });
  }

  Future<bool> createNew(Vocabulary vocab) async {
    bool isSuccess = false;
    try {
      await http.post(url, body: vocab.toJson()).then((response) async {
        if (response.statusCode == 302) {
          // for app it return 302 first
          var url = response.headers['location'];
          await http.get(Uri.parse(url!)).then((response) {
            print(response.body);
            isSuccess =
                jsonDecode(response.body)['status'].toString() == 'SUCCESS';
          });
        } else if (response.statusCode == 200) {
          // for web, it return 200
          isSuccess =
              jsonDecode(response.body)['status'].toString() == 'SUCCESS';
        } else {
          //TODO: error handle
          print(response.statusCode);
        }
      });
    } catch (e) {
      //TODO: error handle
      print(e);
    }
    return isSuccess;
  }
}
