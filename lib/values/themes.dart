import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      background: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: false,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}