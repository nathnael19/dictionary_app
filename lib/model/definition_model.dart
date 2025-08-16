class DefinitionModel {
  final String definition;
  final List<dynamic> synonyms;
  final List<dynamic> antonyms;
  final String? example;

  DefinitionModel({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });

  factory DefinitionModel.fromJson(Map<String, dynamic> json) =>
      DefinitionModel(
        definition: json['definition'],
        synonyms: json['synonyms'],
        antonyms: json['antonyms'],
      );
}
