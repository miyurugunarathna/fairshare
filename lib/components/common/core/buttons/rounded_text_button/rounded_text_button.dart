import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fairshare/constants/constants.dart';

import 'variants.dart';

class RoundedTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final ButtonType type;
  final Color? color;
  final Color? textColor;
  final Color? outlineColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? loading;
  final bool? disabled;
  final MainAxisAlignment? mainAxisAlignment;

  const RoundedTextButton(
    this.text, {
    super.key,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.color,
    this.textColor,
    this.outlineColor,
    this.textStyle,
    this.padding,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.loading = false,
    this.disabled = false,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: !disabled! ? onPressed : null,
      style: ButtonStyle(
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(
            color: outlineColor ?? color ?? buttonOutlineColor[type]!,
            width: 1.0,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(color ?? buttonColors[type]!),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          ),
        ),
        padding: WidgetStateProperty.all(padding ?? const EdgeInsets.all(universalPadding)),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        children: [
          if (loading! || prefixIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: loading!
                  ? SpinKitFadingCircle(
                      color: textColor ?? buttonTextColor[type]!,
                      size: 20.0,
                    )
                  : Icon(
                      prefixIcon,
                      size: 20,
                      color: textColor ?? buttonTextColor[type]!,
                    ),
            ),
          Text(
            text,
            style: (textStyle ?? Theme.of(context).textTheme.titleMedium!).copyWith(
              color: textColor ?? buttonTextColor[type]!,
              fontWeight: FontWeight.w400,
            ),
          ),
          if (suffixIcon != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                suffixIcon,
                size: 20,
                color: textColor ?? buttonTextColor[type]!,
              ),
            ),
        ],
      ),
    );
  }
}
