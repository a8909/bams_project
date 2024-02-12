import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.white.withOpacity(0),
    foregroundColor: Colors.blue,
    elevation: 0,
  );
}

TextStyle style() {
  return const TextStyle(fontSize: 10);
}

TextStyle styles(double size) {
  return TextStyle(fontSize: size);
}
