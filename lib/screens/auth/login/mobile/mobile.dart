import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'portrait.dart';
import 'landscape.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      if (orientation == Orientation.landscape) return const Landscape();
      return const Portrait();
    });
  }
}
