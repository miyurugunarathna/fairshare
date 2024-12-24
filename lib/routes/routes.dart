import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fairshare/screens/home/home.dart';
import 'package:fairshare/screens/auth/login/login.dart';

class Routes {
  static const login = '/login';
  static const home = '/home';
  static const settings = '/settings';

  static PageTransition? onGenerateRoute(route) {
    switch (route.name) {
      case login:
        return PageTransition(child: const Login(), type: PageTransitionType.fade);
      case home:
        return PageTransition(child: const Home(), type: PageTransitionType.fade);
      case settings:
        return PageTransition(child: Container(), type: PageTransitionType.fade);
      default:
        return null;
    }
  }
}
