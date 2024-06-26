import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class Requests<T> {
  Uri getUri(String url) {
    return Uri.parse(url);
  }

  // Get request, the method get is used to set the url of the api that will be passed
  Future<Map<String, dynamic>> get(String apiUrl) async {
    try {
      return responseHandler(await http.get(getUri(apiUrl)));
    } catch (e) {
      throw Exception(e);
    }
  }

  // responseHandler is used for getting and setting the response body
  Map<String, dynamic> responseHandler(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception();
    }
  }
}
