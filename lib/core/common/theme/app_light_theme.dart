import 'package:flutter/material.dart';
import 'package:for_test/core/common/theme/app_theme_extension.dart';

ThemeData appLightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueAccent,
    elevation: 0,
    centerTitle: true,
  ),
  extensions: [appLightThemeExtension],
);
AppColorsExtension appLightThemeExtension = AppColorsExtension(
  primaryColor: Colors.black,
  secondaryColor: Colors.blue,
  textColor: Colors.blueAccent,
);
