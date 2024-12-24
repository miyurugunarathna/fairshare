import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;
  const TextDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(
            endIndent: 10,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Expanded(
          child: Divider(
            indent: 10,
          ),
        ),
      ],
    );
  }
}
