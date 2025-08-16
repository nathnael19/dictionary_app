import 'dart:convert';

import 'package:dictionary/model/dictionary_model.dart';
import 'package:http/http.dart' as http;

class DictionaryRepository {
  Future<List<DictionaryModel>> loadMeaning(String word) async {
    String url = "https://api.dictionaryapi.dev/api/v2/entries/en/$word";
    try {
      final jsonUrl = await http.get(Uri.parse(url));

      if (jsonUrl.statusCode == 200) {
        List<dynamic> jsonMeaning = jsonDecode(jsonUrl.body);
        List<DictionaryModel> meaning = jsonMeaning
            .map((e) => DictionaryModel.fromJson(e))
            .toList();
        return meaning;
      } else {
        throw Exception("Error Fetching Data!!");
      }
    } catch (e) {
      throw Exception("Error");
    }
  }
}
