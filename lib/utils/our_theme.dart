import 'package:flutter/material.dart';

class OurTheme {
  final Color _primaryBlue = const Color.fromARGB(255, 165, 219, 229);
  final Color _lightGrey = const Color.fromARGB(255, 164, 164, 164);
  final Color _darkGrey = const Color.fromARGB(255, 119, 124, 135);

  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: _primaryBlue,
      scaffoldBackgroundColor: _primaryBlue,
      primaryColor: _primaryBlue,
      secondaryHeaderColor: _darkGrey,
      colorScheme: ColorScheme.fromSwatch(
        // primarySwatch: Colors.blue,
        accentColor: _lightGrey, // Set accent color here
      ).copyWith(
        secondary: _lightGrey, // For additional customization
      ),
      hintColor: _lightGrey,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: _lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: _primaryBlue),
      ),
    ),
elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _darkGrey, // Button background color
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          minimumSize: const Size(200.0, 40.0), // Width and height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
    )
  );
  }
}
