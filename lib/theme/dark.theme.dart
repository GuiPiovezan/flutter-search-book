import 'package:flutter/material.dart';
import 'package:flutter_search_book/theme/dark_class_theme.theme.dart';

Color primaryColor = DarkClassTheme().primaryColor;
double fontSize = DarkClassTheme().fontSize;
Color colorPurple = DarkEnumColorsTheme.colorPurple.value;

ThemeData themeData = ThemeData(
  fontFamily: 'Georgia',
  brightness: Brightness.dark,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: colorPurple,
      fontSize: fontSize,
    ),
    enabledBorder: underlineINputBorder,
    border: underlineINputBorder,
    focusedBorder: underlineINputBorder,
  ),
);

InputBorder underlineINputBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: primaryColor,
  ),
);
