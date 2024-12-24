import 'package:flutter/material.dart';

import 'custom_input.dart';

class DropdownInput extends StatelessWidget {
  final String? value;
  final String placeholder;
  final Widget? prefixIcon;
  final List<dynamic> items;
  final EdgeInsetsGeometry? padding;
  final dynamic onChange;

  const DropdownInput({super.key, required this.placeholder, this.value, this.prefixIcon, required this.items, this.padding, this.onChange});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: inputDecoration.copyWith(
        prefixIcon: prefixIcon,
        labelText: placeholder,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        contentPadding: padding ?? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: value,
          onChanged: onChange ?? () {},
          items: items.map((dynamic item) {
            dynamic value = item;
            dynamic label = item;
            if (value.runtimeType != String) {
              value = item["value"];
              label = item["label"];
            }
            return DropdownMenuItem<String>(
              value: value,
              child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
            );
          }).toList(),
          style: Theme.of(context).textTheme.bodyMedium,
          hint: Text(placeholder, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
    );
  }
}
