class LicenseModel {
  final String name;
  final String url;

  const LicenseModel({required this.name, required this.url});

  factory LicenseModel.fromJson(Map<String, dynamic> json) =>
      LicenseModel(name: json['name'], url: json['url']);
}
