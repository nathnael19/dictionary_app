class DefinitionModel {
  final String definition;
  final List<String> synonyms;
  final List<String> antonyms;
  final String? example;

  DefinitionModel({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });

  factory DefinitionModel.fromJson(Map<String, dynamic> json) =>
      DefinitionModel(
        definition: json['definition'] ?? "",
        synonyms: List<String>.from(json['synonyms'] ?? []),
        antonyms: List<String>.from(json['antonyms'] ?? []),
        example: json['example'],
      );
}
