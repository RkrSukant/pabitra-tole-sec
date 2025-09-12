import 'package:flutter/material.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/colors.dart';

class AppTheme {
  static const colors = AppColors();

  const AppTheme._();

  static ThemeData define() {
    return ThemeData(
      fontFamily: 'Poppins',
      primaryColor: colors.backGroundColor,
      scaffoldBackgroundColor: colors.backGroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: colors.secondaryColor,
        surface: colors.whiteRgbaFFFFFF,
        surfaceTint: colors.whiteRgbaFFFFFF,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.greyE8E9F1,
      ),
    );
  }
}