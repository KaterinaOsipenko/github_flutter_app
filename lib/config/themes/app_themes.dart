import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: Color.fromRGBO(20, 99, 245, 1),
        onPrimary: Color.fromRGBO(33, 24, 20, 1),
        secondary: Color.fromRGBO(239, 227, 255, 1),
        background: Color.fromRGBO(249, 249, 249, 1),
        surface: Color.fromRGBO(242, 242, 242, 1),
        onSurface: Color.fromRGBO(191, 191, 191, 1),
      ),
      textTheme: TextTheme(
        displayMedium: GoogleFonts.raleway(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
        ),
        bodyMedium: GoogleFonts.raleway(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color.fromRGBO(20, 99, 245, 1),
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: const Color.fromRGBO(20, 99, 245, 1),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(242, 242, 242, 1)),
          borderRadius: BorderRadius.circular(30),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(242, 242, 242, 1)),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(20, 99, 245, 1)),
          borderRadius: BorderRadius.circular(30),
        ),
        fillColor: const Color.fromRGBO(242, 242, 242, 1),
        filled: true,
      ),
    );
  }
}
