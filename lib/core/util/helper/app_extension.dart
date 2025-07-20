import 'package:flutter/material.dart';
import 'package:for_test/core/common/theme/app_light_theme.dart';
import 'package:for_test/core/common/theme/app_theme_extension.dart';

extension AppTheme on ThemeData {
  AppColorsExtension get appTheme =>
      extension<AppColorsExtension>() ?? appLightThemeExtension;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
