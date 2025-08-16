import 'package:dictionary/model/definition_model.dart';

class MeaningModel {
  final String partOfSpeech;
  final List<DefinitionModel> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  MeaningModel({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  factory MeaningModel.fromJson(Map<String, dynamic> json) => MeaningModel(
    partOfSpeech: json['partOfSpeech'],
    definitions: (json['definitions'] as List)
        .map((e) => DefinitionModel.fromJson(e))
        .toList(),
    synonyms: json['synonyms'],
    antonyms: json['antonyms'],
  );
}
