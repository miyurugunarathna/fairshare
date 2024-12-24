import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:fairshare/components/common/core/core.dart';
import 'package:fairshare/constants/constants.dart';
import 'package:fairshare/state/auth/login/login_bloc.dart';

import 'mobile/mobile.dart';
import 'tablet/tablet.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocProvider(
                  create: (context) => LoginBloc(),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: universalPadding),
                      child: ResponsiveSizer(builder: (context, orientation, screenType) {
                        if (screenType == ScreenType.mobile) return const Mobile();
                        return const Tablet();
                      }),
                    ),
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
