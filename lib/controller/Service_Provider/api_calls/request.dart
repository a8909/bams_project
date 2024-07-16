import 'dart:convert';

import 'package:http/http.dart' as http;

class Services {
  Future<Map<String, dynamic>> doLogin(body) async {
    final response = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        body: jsonEncode(body));
    print(response.body);
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getUsers() async {
    final result = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      throw Exception();
    }
  }

  delS() async {
    await http.delete(Uri.parse("https://reqres.in/api/register"), body: {});
  }
}

class Endpoint {
  final String url = "https://reqres.in/api/register";
  postMethod(body) async {
    return await http.post(Uri.parse(url), body: jsonEncode(body));
  }
}
