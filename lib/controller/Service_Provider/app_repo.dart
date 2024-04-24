import 'package:flutter/material.dart';

import 'user_Service.dart';

class AppRepo extends ChangeNotifier {
  User? user;
  String? _token;

  set token(String? value) {
    _token = value;
  }

  String? get token => _token;
}
