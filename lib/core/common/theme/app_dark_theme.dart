import 'package:flutter/material.dart';
import 'package:for_test/core/common/theme/app_theme_extension.dart';

ThemeData appDarkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    centerTitle: true,
  ),
  extensions: [appDarkThemeExtension],
);
AppColorsExtension appDarkThemeExtension = AppColorsExtension(
  primaryColor: Colors.black,
  secondaryColor: Colors.pink,
  textColor: Colors.white,
);
