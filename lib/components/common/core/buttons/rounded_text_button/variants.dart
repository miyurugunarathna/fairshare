import 'package:flutter/material.dart';
import 'package:fairshare/config/themes/themes.dart';

enum ButtonType { primary, secondary }

final Map<ButtonType, Color> buttonColors = {
  ButtonType.primary: AppColors.primary,
  ButtonType.secondary: Colors.white,
};

final Map<ButtonType, Color> buttonTextColor = {
  ButtonType.primary: Colors.white,
  ButtonType.secondary: AppColors.primary,
};

final Map<ButtonType, Color> buttonOutlineColor = {
  ButtonType.primary: AppColors.primary,
  ButtonType.secondary: AppColors.primary,
};
