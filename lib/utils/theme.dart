import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      elevation: 1,
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.grey[800]),
      titleTextStyle: TextStyle(
        color: Colors.grey[800],
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 4),
    ),
    // Add more customizations as needed
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      elevation: 1,
      color: Colors.grey[850],
    ),
    // Add more customizations as needed
  );

  static final loginGradient = LinearGradient(
    colors: [Colors.blue.shade700, Colors.blue.shade400],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}