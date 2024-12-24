import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fairshare/config/themes/colors.dart';

extension CustomStyles on TextTheme {
  TextStyle get headlineLargeSecondary => headlineLarge!.copyWith(color: AppColors.grayDark);
  TextStyle get headlineLargeTeritary => headlineLarge!.copyWith(color: AppColors.grayMedium);
  TextStyle get headlineLargeQuaternary => headlineLarge!.copyWith(color: AppColors.grayLight);
  TextStyle get headlineMediumSecondary => headlineMedium!.copyWith(color: AppColors.grayDark);
  TextStyle get headlineMediumTeritary => headlineMedium!.copyWith(color: AppColors.grayMedium);
  TextStyle get headlineMediumQuaternary => headlineMedium!.copyWith(color: AppColors.grayLight);
  TextStyle get headlineSmallSecondary => headlineSmall!.copyWith(color: AppColors.grayDark);
  TextStyle get headlineSmallTeritary => headlineSmall!.copyWith(color: AppColors.grayMedium);
  TextStyle get headlineSmallQuaternary => headlineSmall!.copyWith(color: AppColors.grayLight);
  TextStyle get titleLargeSecondary => titleLarge!.copyWith(color: AppColors.grayDark);
  TextStyle get titleLargeTeritary => titleLarge!.copyWith(color: AppColors.grayMedium);
  TextStyle get titleLargeQuaternary => titleLarge!.copyWith(color: AppColors.grayLight);
  TextStyle get titleMediumSecondary => titleMedium!.copyWith(color: AppColors.grayDark);
  TextStyle get titleMediumTeritary => titleMedium!.copyWith(color: AppColors.grayMedium);
  TextStyle get titleMediumQuaternary => titleMedium!.copyWith(color: AppColors.grayLight);
  TextStyle get titleSmallSecondary => titleSmall!.copyWith(color: AppColors.grayDark);
  TextStyle get titleSmallTeritary => titleSmall!.copyWith(color: AppColors.grayMedium);
  TextStyle get titleSmallQuaternary => titleSmall!.copyWith(color: AppColors.grayLight);
  TextStyle get bodyLargeSecondary => bodyLarge!.copyWith(color: AppColors.grayDark);
  TextStyle get bodyLargeTeritary => bodyLarge!.copyWith(color: AppColors.grayMedium);
  TextStyle get bodyLargeQuaternary => bodyLarge!.copyWith(color: AppColors.grayLight);
  TextStyle get bodyLargePlaceholder => bodyLarge!.copyWith(color: AppColors.grayLight);
  TextStyle get bodyMediumSecondary => bodyMedium!.copyWith(color: AppColors.grayDark);
  TextStyle get bodyMediumTeritary => bodyMedium!.copyWith(color: AppColors.grayMedium);
  TextStyle get bodyMediumQuaternary => bodyMedium!.copyWith(color: AppColors.grayLight);
  TextStyle get bodyMediumPlaceholder => bodyMedium!.copyWith(color: AppColors.grayMedium);
  TextStyle get bodySmallSecondary => bodySmall!.copyWith(color: AppColors.grayDark);
  TextStyle get bodySmallTeritary => bodySmall!.copyWith(color: AppColors.grayMedium);
  TextStyle get bodySmallQuaternary => bodySmall!.copyWith(color: AppColors.grayLight);
}

TextTheme lightTextTheme = GoogleFonts.poppinsTextTheme(const TextTheme(
  headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
  headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
  headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
  titleLarge: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
  titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
  titleSmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
  bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
  bodyMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
  bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
  labelLarge: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w400),
  labelMedium: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400),
  labelSmall: TextStyle(fontSize: 9.0, fontWeight: FontWeight.w400),
));

TextTheme darkTextTheme = GoogleFonts.poppinsTextTheme(); // No dark theme yet. Extend as needed.
