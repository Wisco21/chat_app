import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: const Color(0xFFECECEC),
    primary: const Color(0xFF8A8FA3),
    secondary: const Color(0xFFADBBC6),
    inversePrimary: Colors.grey.shade800,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.grey[800],
        displayColor: Colors.black,
      ),
);
