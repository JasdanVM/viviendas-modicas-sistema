import 'package:flutter/material.dart';

class CustomColor {
  static const int _cVerdePrimaryValue = 0xFF004100;
  static const MaterialColor cVerde = MaterialColor(
    _cVerdePrimaryValue,
    <int, Color>{
      50: Color(0xFFE8F5E9),
      100: Color(0xFFC8E6C9),
      200: Color(0xFFA5D6A7),
      300: Color(0xFF81C784),
      400: Color(0xFF66BB6A),
      500: Color(_cVerdePrimaryValue),
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    },
  );
}

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  useMaterial3: false,
  primarySwatch: CustomColor.cVerde,
);

ThemeData darkMode = ThemeData.dark().copyWith(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: CustomColor.cVerde,
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[400] ?? Colors.white,), // Set border color to white when inactive
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Color(0xFF107C10), // Set text button text color to #107C10
    ),
  ),
  // Apply custom green to buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(CustomColor.cVerde),
    ),
  ),
  // Apply custom green to floating action buttons
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: CustomColor.cVerde,
  ),
  // Apply custom green to popups
  popupMenuTheme: PopupMenuThemeData(
    color: CustomColor.cVerde,
  ),
  primaryColor: CustomColor.cVerde,
);
