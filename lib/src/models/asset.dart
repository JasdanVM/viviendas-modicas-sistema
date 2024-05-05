import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart';
import '../models/theme_provider.dart';

String getAssetPath(BuildContext context) {
  final theme = Provider.of<ThemeProvider>(context);
  return theme.themeData == darkMode ? 'assets/icon_vm.png' : 'assets/vm_icon.png';
}

