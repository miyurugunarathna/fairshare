import 'package:flutter/material.dart';
import 'package:fairshare/components/common/core/core.dart';
import 'package:fairshare/config/themes/themes.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
  final String buttonText;
  final VoidCallback? onPressed;
  const CustomErrorWidget({super.key, required this.error, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.info_outline,
          size: 90,
        ),
        const SizedBox(height: 30),
        Text(
          error,
          style: Theme.of(context).textTheme.titleMediumTeritary.copyWith(fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        RoundedTextButton(
          buttonText,
          onPressed: onPressed != null ? onPressed! : Navigator.of(context).pop,
          textStyle: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
