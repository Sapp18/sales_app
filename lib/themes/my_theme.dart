import 'package:flutter/material.dart';
import 'package:sales_app/themes/themes.dart';

class MyTheme {
  static final ThemeData myTheme = ThemeData.dark().copyWith(
    cardColor: ThemeColors.white2,
    dividerColor: Colors.transparent,
    scaffoldBackgroundColor: ThemeColors.background,
    //Tema de AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeColors.background,
      elevation: 0,
      titleTextStyle: AppTypography.text20w500White1,
    ),
    //Tema de TextFormField
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: AppTypography.text12w400Error1,
      floatingLabelStyle: AppTypography.text16w400White1,
      iconColor: ThemeColors.blue1,
      isDense: true,
      labelStyle: AppTypography.text14w400Blue1,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.none,
          width: 0,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: ThemeColors.purple1,
        elevation: 0,
        foregroundColor: ThemeColors.white1,
        textStyle: AppTypography.text16w400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
      ),
    ),
    //Tema de TextSelection
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ThemeColors.blue1,
      selectionColor: ThemeColors.blue1,
      selectionHandleColor: ThemeColors.purple1,
    ),
  );
}
