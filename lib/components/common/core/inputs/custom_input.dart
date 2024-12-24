import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fairshare/config/themes/themes.dart';

final inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.grayLight.withOpacity(0.5),
    ),
    borderRadius: BorderRadius.circular(8.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.black,
    ),
    borderRadius: BorderRadius.circular(8.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.red,
    ),
    borderRadius: BorderRadius.circular(8.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.red,
    ),
    borderRadius: BorderRadius.circular(8.0),
  ),
  prefixIconConstraints: const BoxConstraints(minWidth: 50),
  suffixIconConstraints: const BoxConstraints(minWidth: 50),
  floatingLabelBehavior: FloatingLabelBehavior.never,
);

class CustomInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? value;
  final String? hint;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? cursorColor;
  final EdgeInsetsGeometry? padding;
  final dynamic onChange;
  final Function(PointerDownEvent)? onTapOutside;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final TextCapitalization? textCapitalization;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final bool isDatePicker;
  final bool? filled;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final OutlineInputBorder? enabledBorder;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  const CustomInput({
    super.key,
    this.placeholder,
    this.hint,
    this.controller,
    this.value,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.cursorColor,
    this.padding,
    this.onChange,
    this.onTapOutside,
    this.keyboardType,
    this.onTap,
    this.textCapitalization,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 1,
    this.readOnly = false,
    this.isDatePicker = false,
    this.filled,
    this.floatingLabelBehavior,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.enabledBorder,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, readOnly ? -7.5 : 0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        onChanged: onChange ?? (String value) {},
        onTapOutside: onTapOutside ??
            (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
        initialValue: value,
        decoration: inputDecoration.copyWith(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: placeholder,
          labelStyle: Theme.of(context).textTheme.bodyLargePlaceholder,
          hintText: hint ?? placeholder,
          hintStyle: Theme.of(context).textTheme.bodyLargePlaceholder,
          fillColor: AppColors.inputBackground,
          filled: filled ?? !readOnly,
          contentPadding: padding ?? EdgeInsets.symmetric(horizontal: (prefixIcon != null ? 10 : 14), vertical: readOnly ? 2 : 10),
          enabledBorder: enabledBorder,
          disabledBorder: InputBorder.none,
          enabled: !readOnly,
          floatingLabelBehavior: floatingLabelBehavior ?? (readOnly ? FloatingLabelBehavior.always : FloatingLabelBehavior.never),
          floatingLabelStyle: Theme.of(context).textTheme.bodyLargePlaceholder.copyWith(fontSize: 17),
          errorMaxLines: 3,
        ),
        style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
        cursorColor: cursorColor,
        textAlign: textAlign,
        validator: validator,
        keyboardType: keyboardType,
        onTap: onTap,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        maxLength: maxLength,
        minLines: minLines,
        maxLines: maxLines,
        readOnly: isDatePicker ? true : readOnly,
        canRequestFocus: !readOnly,
        inputFormatters: inputFormatters,
        autovalidateMode: autovalidateMode,
      ),
    );
  }
}
