import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: createMaterialColor(AppColors.primaryColor),
  // colorSchemeSeed: primaryColor,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  primaryColor: AppColors.primaryColor,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: primaryColor,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.black),
  ),
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0,
    titleSpacing: 20,
    backgroundColor: AppColors.backgroundColor,
    // Set the color here

    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    // backgroundColor: AppColors.blackColor,
    elevation: 0,
  ),

  scaffoldBackgroundColor: AppColors.backgroundColor,
);

MaterialColor createMaterialColor(Color color) {
  List<int> strengths = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int strength in strengths) {
    final double ds = strength / 900;
    swatch[strength] = Color.fromRGBO(r, g, b, ds);
  }
  return MaterialColor(color.value, swatch);
}
