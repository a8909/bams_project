import 'package:bams_project/controller/Service_Provider/login_response.dart';
import 'package:bams_project/controller/Service_Provider/login_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String email = "";
  String password = "";
  Future<LoginResponse> login() async {
    return LoginService(email: email, password: password).call();
  }
}
