import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vocab_card/model/vocab.dart';

class DataController {
  static Uri url = Uri.https('script.google.com',
      '/macros/s/AKfycbxAK8BaoNXOI6BuUDFZHWpMtfTpWd-TiVk93cXrHwvMzzQhRkVZ4u3OUvt8fPb5lnxdSg/exec');
  Future<List<Vocab>> getVocabList() async {
    return await http.get(url).then((response) {
      var jsonFeedback = jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => Vocab.fromJson(json)).toList();
    });
  }

  Future<bool> createNew(Vocab vocab) async {
    bool isSuccess = false;
    try {
      await http.post(url, body: vocab.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(Uri.parse(url!)).then((response) {
            isSuccess =
                jsonDecode(response.body)['status'].toString() == 'SUCCESS';
          });
        } else {}
      });
    } catch (e) {
      print(e);
    }
    return isSuccess;
  }
}
