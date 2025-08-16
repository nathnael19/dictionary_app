import 'package:dictionary/model/license_model.dart';

class PhoneticModel {
  final String audio;
  final String? sourceUrl;
  final LicenseModel? license;
  final String? text;

  PhoneticModel({required this.audio, this.sourceUrl, this.license, this.text});

  factory PhoneticModel.fromJson(Map<String, dynamic> json) => PhoneticModel(
    audio: json['audio'],
    license: json['license'],
    sourceUrl: json['sourceUrl'],
    text: json['text'],
  );
}
