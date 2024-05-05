import 'package:flutter/material.dart';
import 'package:viviendas_modicas_sistema/src/models/colors.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeController _themeController = Get.put(ThemeController());
  late ThemeData _themeData;

  ThemeProvider() {
    _themeData = _themeController.theme == 'light'? lightMode : darkMode;
  }

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    if (themeData == lightMode) {
      _themeController.saveTheme('light');
    } else {
      _themeController.saveTheme('dark');
    }
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}