import 'package:flutter/material.dart';

class AppTheme {
  static const double bodyFontSize = 14;
  static const double xsmallFontSize = 12;
  static const double smallFontSize = 16;
  static const double normalFontSize = 18;
  static const double largeFontSize = 20;
  static const double xlargeFontSize = 22;

  static final ThemeData appThtme = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: Color(0xff88afd5),
    accentColor: Color(0xff90c0ef),
    canvasColor: Color(0xffF5F5F5),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: bodyFontSize),
      headline1: TextStyle(fontSize: xsmallFontSize),
      headline2: TextStyle(fontSize: smallFontSize, color: Colors.black87),
      headline3: TextStyle(fontSize: normalFontSize, color: Colors.black87),
      headline4: TextStyle(fontSize: largeFontSize, color: Colors.black87),
      headline5: TextStyle(fontSize: xlargeFontSize, color: Colors.black87),
    ),
  );
}
