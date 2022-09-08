import 'package:flutter/material.dart';

enum DarkEnumColorsTheme {
  colorPurple(Colors.purple);

  final Color value;
  const DarkEnumColorsTheme(this.value);
}

Color primaryColor = const Color.fromRGBO(156, 39, 176, 1);
Color whiteColor = Colors.white;
double fontSize = 26.0;
