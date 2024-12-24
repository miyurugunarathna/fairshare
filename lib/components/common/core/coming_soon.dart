import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Stay tuned"),
      content: const Text("This feature is coming soon"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("OK", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
