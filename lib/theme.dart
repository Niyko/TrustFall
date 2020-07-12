import 'package:flutter/material.dart';

class ThemeColors {
  Color light_yellow = Color(0xffffde55);
  Color dark_yellow = Color(0xffffc530);
  Color grey = Color(0xff434343);
  Color black = Color(0xff09090B);
}

class AppThemes {
  ThemeData get light => ThemeData(
    primarySwatch: Colors.yellow,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Raleway',
  );

  ThemeData get dark => ThemeData(
    primarySwatch: Colors.yellow,
    scaffoldBackgroundColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Raleway',
  );
}