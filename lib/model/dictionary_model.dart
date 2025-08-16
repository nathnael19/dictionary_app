class DictionaryModel {
  final String word;
  final List<Phonetic> phonetics;
  final List<Meaning> meanings;
  final License license;
  final List<String> sourceUrls;

  DictionaryModel({
    required this.word,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });
}

class License {
  final String name;
  final String url;

  License({required this.name, required this.url});
}

class Meaning {
  final String partOfSpeech;
  final List<Definition> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });
}

class Definition {
  final String definition;
  final List<dynamic> synonyms;
  final List<dynamic> antonyms;
  final String? example;

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });
}

class Phonetic {
  final String audio;
  final String? sourceUrl;
  final License? license;
  final String? text;

  Phonetic({required this.audio, this.sourceUrl, this.license, this.text});
}
