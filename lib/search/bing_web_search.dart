import 'dart:io';
import 'dart:convert';

class BingWebSearch {

  request() async {
    // produces a request object
    var request = await HttpClient().getUrl(Uri.parse('https://swapi.co/api/people/1'));
    // sends the request
    var response = await request.close();

    // transforms and prints the response
    await for (var contents in response.transform(Utf8Decoder())) {
      return contents;
    }
  }
}
