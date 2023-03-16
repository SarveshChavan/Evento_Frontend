import 'package:events/screens/bottomNavgation_bar.dart';
import 'package:events/screens/change_password.dart';
import 'package:events/screens/ongoing_screen.dart';
import 'package:events/screens/profile_details.dart';
import 'package:events/screens/profile_screen.dart';
import 'package:events/screens/security_question_screen.dart';
import 'package:events/screens/signin_screen.dart';
import 'package:events/screens/signup_screen.dart';
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
        var args = routeSettings.arguments as Map;
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => SecurityQuestion(email: args['email'], userName: args['userName'], password: args['password']));

      case ProfileDetails.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => ProfileDetails());

      case ChangePassword.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => ChangePassword());

      case bottomnavigation_bar.routeName:
        return MaterialPageRoute(builder: (_)=>bottomnavigation_bar());


      default: return null;

    }
  }
}

