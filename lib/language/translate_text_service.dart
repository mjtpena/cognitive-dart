library cognitive_services;

import 'dart:convert';
import 'dart:io';

part "translate_text_request.dart";
part "translate_text_response.dart";

class TranslateTextService {
  String host = "https://api.cognitive.microsofttranslator.com";
  String route =
      "/translate?api-version=3.0&to="; //TODO: Handle multiple languages gracefully

  Future<List<TranslateTextResponse>> fetch(
      List<TranslateTextRequest> translateTextRequest,
      String languageCode,
      String subscriptionKey) async {
    List<TranslateTextResponse> textResponses = [];

    final response = await apiRequest(
        host + route + languageCode, translateTextRequest, subscriptionKey);

    List<dynamic> responseLists = json.decode(response);

    for (var item in responseLists) {
      TranslateTextResponse translateTextResponse =
          TranslateTextResponse.fromJson(item);
      textResponses.add(translateTextResponse);
    }

    return textResponses;
  }

  Future<String> apiRequest(
      String url, List jsonMap, String subscriptionKey) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.headers.set('Ocp-Apim-Subscription-Key', subscriptionKey);
    request.add(utf8.encode(json.encode(jsonMap)));
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      return reply;
    } else {
      // If that response was not OK, throw an error.
      throw Exception(response.reasonPhrase);
    }
  }
}
