import 'package:events/screens/home_screen.dart';
import 'package:events/screens/signin_screen.dart';
import 'package:events/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {

      case SignUpScreen.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => SignUpScreen());

      case SignInScreen.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => SignInScreen());

      case HomeScreen.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => HomeScreen());

      default: return null;
    }
  }
}