part of cognitive_services;

class TranslateTextRequest {
  final String text;

  TranslateTextRequest({this.text});

  static TranslateTextRequest fromJson(Map<String, dynamic> json) {
    return TranslateTextRequest(
      text: json['Text'],
    );
  }

  Map<String, dynamic> toJson() => {'Text': text};
}
