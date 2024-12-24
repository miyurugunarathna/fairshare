import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:fairshare/components/common/core/core.dart';
import 'package:fairshare/constants/constants.dart';

import 'mobile/mobile.dart';
import 'tablet/tablet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: universalPadding),
                    child: ResponsiveSizer(builder: (context, orientation, screenType) {
                      if (screenType == ScreenType.mobile) return const Mobile();
                      return const Tablet();
                    }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
