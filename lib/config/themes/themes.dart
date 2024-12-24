import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fairshare/config/themes/text.dart';

import 'colors.dart';

export "colors.dart";
export "text.dart";

class Themes {
  static final _light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(primary: AppColors.primary, brightness: Brightness.light),
    textTheme: lightTextTheme,
    primaryTextTheme: Typography(platform: TargetPlatform.iOS).black,
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: lightTextTheme.displayLarge,
      backgroundColor: AppColors.background,
      toolbarHeight: 60,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.black, statusBarBrightness: Brightness.light),
    ),
    scaffoldBackgroundColor: AppColors.background,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
      elevation: 50,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.divider,
      space: 0,
      thickness: 1,
    ),
  );

  static final _dark = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(primary: AppColors.primary, brightness: Brightness.light),
    textTheme: darkTextTheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: darkTextTheme.displayLarge,
      backgroundColor: Colors.black,
      toolbarHeight: 70,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.black, statusBarBrightness: Brightness.light),
    ),
    scaffoldBackgroundColor: Colors.black,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.black,
      elevation: 50,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.divider,
      space: 0,
      thickness: 1,
    ),
  );

  static Map<String, ThemeData> list = {
    "light": _light,
    "dark": _dark,
  };
}
