

import 'package:events/screens/bottomNavgation_bar.dart';
import 'package:events/screens/ongoing_screen.dart';
import 'package:events/screens/profile_screen.dart';
import 'package:events/screens/profile_details.dart';
import 'package:events/screens/security_question_screen.dart';

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

      case ongoingScreen.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => ongoingScreen());

      case Profilescreen.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => Profilescreen());


      case SecurityQuestion.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => SecurityQuestion());

      case ProfileDetails.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => ProfileDetails());

      case bottomnavigation_bar.routeName:
        return MaterialPageRoute(builder: (_)=>bottomnavigation_bar());
      default: return null;

    }
  }
}

