part of cognitive_services;

class BingSpellCheckRequest {
  final String text;

  BingSpellCheckRequest({this.text});

  static BingSpellCheckRequest fromJson(Map<String, dynamic> json) {
    return BingSpellCheckRequest(
      text: json['Text'],
    );
  }

  Map<String, dynamic> toJson() => {'Text': text};
}
