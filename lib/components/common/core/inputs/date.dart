import 'package:flutter/material.dart';
import 'package:fairshare/components/common/common.dart';

class DateInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? initial;
  final Function(String)? onDateSelect;
  final String placeholder;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? Function(String?)? validator;
  final bool disableFutureDates;
  const DateInput(
      {super.key,
      this.initial,
      this.controller,
      this.onDateSelect,
      required this.placeholder,
      this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.readOnly = false,
      this.floatingLabelBehavior,
      this.validator,
      this.disableFutureDates = false});

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      controller: controller,
      placeholder: placeholder,
      hint: hint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onTap: () {
        String? date = initial;
        if (date != null && date.isNotEmpty && date.split("-").first.length != 4) {
          date = date.split("-").reversed.join("-");
        }
        showDatePicker(
          context: context,
          initialDate: date == null || date.isEmpty ? DateTime.now() : DateTime.parse(date),
          firstDate: DateTime(1500),
          lastDate: disableFutureDates ? DateTime.now() : DateTime(3000),
        ).then((date) {
          if (date != null) {
            final parsed = date.toString().substring(0, 10);
            onDateSelect?.call(parsed);
            if (controller != null) {
              controller!.text = parsed;
            }
          }
        });
      },
      readOnly: readOnly,
      isDatePicker: true,
      floatingLabelBehavior: floatingLabelBehavior,
    );
  }
}
