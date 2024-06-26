import 'dart:convert';

import 'package:bams_project/controller/Service_Provider/login_response.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final String email;
  final String password;

  LoginService({required this.email, required this.password});
  Future<LoginResponse> call(String urls) async {
    var url = urls;
    final body = {"email": email, "password": password};
    print(jsonEncode(body));
    final result = await http.post(Uri.parse(url), body: body);
    print(result.body);
    return LoginResponse.fromjson(jsonDecode(result.body));
  }
}
