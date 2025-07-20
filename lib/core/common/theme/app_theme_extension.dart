import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;

  AppColorsExtension({
    required this.primaryColor,
    required this.secondaryColor,
    required this.textColor,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? textColor,
  }) {
    return AppColorsExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }
}
