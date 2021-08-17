import 'package:flutter/material.dart';

const berlinBrightYellow = Color(0xFFFFD300);
const berlinDarkYellow = Color(0xFFFFB900);

const zombieBackground = Color(0xff422f3c);
const planetBackground = Color(0xff16053e);
const handBackground = Color(0xff4f0052);
const paintingBackground = Color(0xff412047);

final appBarTheme = AppBarTheme(
  elevation: 0,
  color: berlinBrightYellow,
);

final appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: berlinBrightYellow,
  accentColor: berlinDarkYellow,
  appBarTheme: appBarTheme,
  fontFamily: 'Montserrat',
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
  ),
);
