library cognitive_services;

import 'dart:convert';
import 'dart:io';

part "bing_spell_check_request.dart";
part "bing_spell_check_response.dart";

class BingSpellCheckService {
  String host = "https://api.cognitive.microsoft.com";
  String route = "/bing/v7.0/spellcheck?";
  String params = "mkt=en-us&mode=proof";

  Future<BingSpellCheckResponse> fetch(
      String text, String subscriptionKey) async {
    final response =
        await apiRequest(host + route + params, text, subscriptionKey);

    var jsonResponse = json.decode(response);

    return BingSpellCheckResponse.fromJson(jsonResponse);
  }

  Future<String> apiRequest(
      String url, String text, String subscriptionKey) async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/x-www-form-urlencoded');
    request.headers.set('content-length', text.length + 5);
    request.headers.set('Ocp-Apim-Subscription-Key', subscriptionKey);
    request.write("text=" + text);
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String reply = await utf8.decoder.bind(response).join();
      httpClient.close();
      return reply;
    } else {
      // If that response was not OK, throw an error.
      throw Exception(response);
    }
  }
}
