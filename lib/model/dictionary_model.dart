import 'package:dictionary/model/license_model.dart';
import 'package:dictionary/model/meaning_model.dart';
import 'package:dictionary/model/phonetic_model.dart';

class DictionaryModel {
  final String word;
  final List<PhoneticModel> phonetics;
  final List<MeaningModel> meanings;
  final LicenseModel license;
  final List<String> sourceUrls;

  DictionaryModel({
    required this.word,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  factory DictionaryModel.fromJson(Map<String, dynamic> json) =>
      DictionaryModel(
        word: json['word'] ?? "",
        phonetics: (json['phonetics'] as List? ?? [])
            .map((e) => PhoneticModel.fromJson(e))
            .toList(),
        meanings: (json['meanings'] as List? ?? [])
            .map((e) => MeaningModel.fromJson(e))
            .toList(),
        license: LicenseModel.fromJson(json['license']),
        sourceUrls: List<String>.from(json['sourceUrls'] ?? []),
      );
}
