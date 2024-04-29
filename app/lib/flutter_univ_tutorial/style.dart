import 'package:flutter/material.dart';

ThemeData myThemeColor = ThemeData(
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.lightBlueAccent, foregroundColor: Colors.white),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.lightBlueAccent, foregroundColor: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.lightBlueAccent),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
  ),
);
