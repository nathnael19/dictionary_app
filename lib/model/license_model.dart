class License {
  final String name;
  final String url;

  const License({required this.name, required this.url});

  factory License.fromJson(Map<String, dynamic> json) =>
      License(name: json['name'], url: json['url']);
}
