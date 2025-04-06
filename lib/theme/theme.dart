import 'package:flutter/material.dart';

const primaryColor = Color(0xFF006FFD);
const secondaryColor = Color(0xFF0044CC);
const backgroundColor = Color(0xFFF5F5F5);

const primaryFont = 'Roboto';
const secondaryFont = 'Arial';

final ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  primarySwatch: Colors.blue,
  hintColor: secondaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
      textStyle: const TextStyle(fontSize: 16, fontFamily: primaryFont),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primaryColor,
      textStyle: const TextStyle(fontSize: 16, fontFamily: primaryFont),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryColor,
      side: const BorderSide(color: primaryColor),
      textStyle: const TextStyle(fontSize: 16, fontFamily: primaryFont),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: primaryFont),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: primaryFont),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, fontFamily: primaryFont),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, fontFamily: primaryFont),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    labelStyle: TextStyle(fontSize: 14, fontFamily: primaryFont),
    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
    errorStyle: TextStyle(color: Colors.red, fontSize: 12),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: primaryFont),
  ),
  iconTheme: const IconThemeData(
    color: primaryColor,
    size: 24,
  ),
  scaffoldBackgroundColor: backgroundColor,
);
