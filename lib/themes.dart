

import 'package:flutter/material.dart';

createLightTheme() {
  return ThemeData(
    primarySwatch: MaterialColor(
    const Color(0xFF85144b).value,
      {
        50: Colors.red.shade50,
        100: Colors.red.shade100,
        200: Colors.red.shade200,
        300: Colors.red.shade300,
        400: Colors.red.shade400,
        500: Colors.red.shade500,
        600: Colors.red.shade600,
        700: Colors.red.shade700,
        800: const Color(0xFF85144b),
        900: const Color(0xFF85144b)
      }
    ),
    primaryColor: const Color(0xFF85144b),
    useMaterial3: false,
    chipTheme: const ChipThemeData(
      labelStyle: TextStyle(fontSize: 12, color: Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4))
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      minimumSize: const Size(40, 40)
    )),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder()
    )
  );
}