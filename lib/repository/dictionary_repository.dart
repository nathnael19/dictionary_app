import 'dart:convert';
import 'package:dictionary/model/dictionary_model.dart';
import 'package:http/http.dart' as http;

class DictionaryRepository {
  Future<List<DictionaryModel>> loadMeaning(String word) async {
    final url = Uri.parse(
      "https://api.dictionaryapi.dev/api/v2/entries/en/$word",
    );
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => DictionaryModel.fromJson(e)).toList();
      } else if (response.statusCode == 404) {
        throw Exception("No definition found for \"$word\"");
      } else {
        throw Exception(
          "Failed to fetch data. Status code: ${response.statusCode}",
        );
      }
    } catch (e) {
      throw Exception("Error fetching word: $e");
    }
  }
}
