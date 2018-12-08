import 'package:test/test.dart';

import 'package:cognitive_services/language/bing_spell_check/bing_spell_check.dart';

void main() {
  group("Bing Spellcheck", () {
    test('It checks wrong spellings', () async {
      String subsKey = "e4b9788c00164b5db2ed3ee0129d1dd9";
      final spellChecker = BingSpellCheckService();
      final message = BingSpellCheckRequest(text: "Their iz sumthing wong!");
      BingSpellCheckResponse response =
          await spellChecker.fetch(message.text, subsKey);
      expect(response, isNotNull);
      var bingSpellCheckResponse = response;
      expect(bingSpellCheckResponse, isNotNull);
      expect(
          bingSpellCheckResponse
              .flaggedTokens.first.suggestions.first.suggestion,
          "There");
      expect(
          bingSpellCheckResponse.flaggedTokens[1].suggestions.first.suggestion,
          "is");
      expect(
          bingSpellCheckResponse.flaggedTokens[2].suggestions.first.suggestion,
          "something");
      expect(
          bingSpellCheckResponse.flaggedTokens[3].suggestions.first.suggestion,
          "wrong");
    });
  });
}
