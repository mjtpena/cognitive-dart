import 'package:test/test.dart';

import 'package:cognitive_services/language/translate_text_service.dart';

void main() {
  group("Text Translations", () {
    test('It translates from English to Spanish', () async {
      String subsKey = "863c1c7b0293450396d16ea6d8794dbb";
      final translator = TranslateTextService();
      final message = [
        TranslateTextRequest(text: "Hello World!"),
      ];
      var response = await translator.fetch(message, "es", subsKey);
      expect(response, isNotNull);
      expect(response.length, greaterThanOrEqualTo(1));
      var translateTextResponse = response.first;
      expect(translateTextResponse, isNotNull);
      expect(translateTextResponse.detectedLanguage.language, "en");
      expect(translateTextResponse.translations.first.to, "es");
      expect(translateTextResponse.translations.first.text, "¡Hola mundo!");
    });

    test('with two requests translates to two Languages each', () async {
      String subsKey = "863c1c7b0293450396d16ea6d8794dbb";
      final translator = TranslateTextService();
      final message = [
        TranslateTextRequest(text: "Good Morning!"),
        TranslateTextRequest(text: "How are you?")
      ];
      var response = await translator.fetch(message, "it&to=de", subsKey);
      expect(response, isNotNull);
      expect(response.length, greaterThanOrEqualTo(1));
      var translateTextResponse1 = response.first;
      expect(translateTextResponse1, isNotNull);
      expect(translateTextResponse1.detectedLanguage.language, "en");
      expect(translateTextResponse1.translations.first.to, "it");
      expect(translateTextResponse1.translations.first.text, "Buongiorno!");
      expect(translateTextResponse1.translations[1].to, "de");
      expect(translateTextResponse1.translations[1].text, "Guten Morgen!");

      var translateTextResponse2 = response[1];
      expect(translateTextResponse2, isNotNull);
      expect(translateTextResponse2.detectedLanguage.language, "en");
      expect(translateTextResponse2.translations.first.to, "it");
      expect(translateTextResponse2.translations.first.text, "Come stai?");
      expect(translateTextResponse2.translations[1].to, "de");
      expect(translateTextResponse2.translations[1].text, "Wie geht es dir?");
    });
  });
}
