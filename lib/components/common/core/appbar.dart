import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fairshare/config/themes/themes.dart';
import 'package:fairshare/constants/constants.dart';
import 'package:fairshare/routes/routes.dart';

class CustomAppBar extends StatelessWidget {
  final bool settings;
  final VoidCallback? onBackPress;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.onBackPress,
    this.settings = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      scrolledUnderElevation: 0,
      expandedHeight: 50,
      backgroundColor: Colors.transparent,
      leading: onBackPress != null
          ? GestureDetector(
              onTap: onBackPress!,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                  color: AppColors.primary,
                ),
              ),
            )
          : null,
      automaticallyImplyLeading: false,
      actions: [
        if (settings)
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.settings),
              child: const Icon(
                Icons.settings,
                color: AppColors.primary,
                size: 27,
              )),
        if (actions != null) ...actions!,
        if (settings || actions != null) const SizedBox(width: universalPadding),
      ],
    );
  }
}
