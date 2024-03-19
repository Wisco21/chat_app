import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      background: const Color(0XFF235784),
      primary: Colors.grey.shade500,
      secondary: const Color(0xFFc1dadf),
      inversePrimary: Colors.white),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
);


// 0c7b93
// 00abcc
// c1dadf
// 27496D
// 3D5872