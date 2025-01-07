import 'package:flutter/material.dart';

class AppThemes {
  //Light Theme

  static final lightTheme=ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.yellow[100],
    dialogBackgroundColor: Colors.yellow[300],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.yellow[400],
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    cardColor: Colors.yellow[400],
    textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
      bodySmall: TextStyle(color: Colors.black54, fontSize: 12),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.yellow[400],
    ),
  );

  //Dark Theme
  static final darkTheme=ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white54,
    scaffoldBackgroundColor: Colors.black,
    dialogBackgroundColor: Colors.grey[800],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    cardColor: Colors.grey[850],
    textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
      bodySmall: TextStyle(color: Colors.white54, fontSize: 12),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.grey[850],
    ),
  );
}