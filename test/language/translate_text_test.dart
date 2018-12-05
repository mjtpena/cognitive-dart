import 'package:test/test.dart';

import 'package:cognitive_services/language/translate_text_service.dart';

void main() {
  test('It translates from English to Spanish', () async {
    String subsKey = "863c1c7b0293450396d16ea6d8794dbb";
    final translator = TranslateTextService();
    final message = TranslateTextRequest(text: "Hello World!").toJson();
    var response = await translator.fetch(message, subsKey);
    expect(response, isNotNull);
  });
}
