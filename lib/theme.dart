import 'package:flutter/material.dart';

class AppTheme {
  static const Color beige = Color(0xFFF4EBDD);
  static const Color blueGrey = Color(0xFF607D8B);

  static ThemeData theme = ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: beige,
    appBarTheme: AppBarTheme(
      backgroundColor: beige,
      elevation: 0,
      iconTheme: IconThemeData(color: blueGrey),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: blueGrey,
      primary: blueGrey,
    ),
  );
}
