library cognitive_services;

import 'dart:convert';
import 'dart:io';

part "translate_text_request.dart";
part "translate_text_response.dart";

class TranslateTextService {
  String host = "https://api.cognitive.microsofttranslator.com";
  String route = "/translate?api-version=3.0&to=de&to=it";
  static String subscriptionKey =
      "863c1c7b0293450396d16ea6d8794dbb"; //This is just for experiment, this is just a free tier
  Map<String, String> headers = {"Ocp-Apim-Subscription-Key": subscriptionKey};

  Future<TranslateTextResponse> fetch(Map<String, dynamic> message) async {
    List jsonArrayRequest = [message];

    final response =
        await apiRequest(host + route, jsonArrayRequest, subscriptionKey);

    var responseTrimmed = response.substring(1, response.length - 1);
    return TranslateTextResponse.fromJson(json.decode(responseTrimmed));
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

  Map dict(List l) {
    final m = {};
    l.forEach((e) {
      m[e[0]] = e[1];
    });
    return m;
  }
}
