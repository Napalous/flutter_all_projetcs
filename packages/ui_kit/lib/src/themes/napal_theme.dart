import 'package:flutter/material.dart';
import 'yas_colors.dart';

class NapalThemes {
  static ThemeData getTheme({String? fontFamily}) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: NapalColors.background),
      primaryColor: NapalColors.primary,
      useMaterial3: true,
      scaffoldBackgroundColor: NapalColors.background,
      fontFamily: fontFamily,
    );
  }

  static const otpFieldStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 25,
    color: NapalColors.textPrimary,
  );

  static const fieldStyle = TextStyle(
    color: NapalColors.textPrimary,
    fontSize: 16.87,
    fontWeight: FontWeight.w600,
  );

  static const fieldLabelStyle = TextStyle(
    color: NapalColors.textSecondary,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static var fieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(
      color: NapalColors.lightGrey,
      width: 1,
    ),
  );

  static var fieldSelectedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(
      color: NapalColors.darkGrey,
      width: 1,
    ),
  );
}
