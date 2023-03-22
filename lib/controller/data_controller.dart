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
}
