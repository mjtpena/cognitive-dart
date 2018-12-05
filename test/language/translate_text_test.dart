import 'package:test/test.dart';

import 'package:cognitive_services/language/translate_text_service.dart';

void main() {
  test('It translates from English to Spanish', () async {
    final translator = TranslateTextService();
    final message = TranslateTextRequest(text: "Hello World!").toJson();
    var response = await translator.fetch(message);
    expect(response.translations, isNotNull);
  });
}
