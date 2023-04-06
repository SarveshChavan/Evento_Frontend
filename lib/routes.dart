import 'package:events/screens/event/add_event.dart';
import 'package:events/screens/event/event_page_host.dart';
import 'package:events/screens/event/event_page_others.dart';
import 'package:events/screens/home_wrapper.dart';
import 'package:events/screens/loading.dart';
import 'package:events/screens/profile/change_password.dart';
import 'package:events/screens/event/ongoing_screen.dart';
import 'package:events/screens/profile/profile_details.dart';
import 'package:events/screens/authentication/security_question_screen.dart';
import 'package:events/screens/authentication/signin_screen.dart';
import 'package:events/screens/authentication/signup_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SignUpScreen.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => SignUpScreen());

      case SignInScreen.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => SignInScreen());

      case OngoingScreen.routeName:
        var args = routeSettings.arguments as Map;
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => OngoingScreen(
                  ongoing: args['ongoing'],
                ));

      case SecurityQuestion.routeName:
        var args = routeSettings.arguments as Map;
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => SecurityQuestion(
                email: args['email'],
                userName: args['userName'],
                password: args['password']));

      case ProfileDetails.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => ProfileDetails());

      case ChangePassword.routeName:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => ChangePassword());

      case HomeWrapper.routeName:
        return MaterialPageRoute(builder: (_) => HomeWrapper());

      case AddEvent.routeName:
        return MaterialPageRoute(builder: (_) => AddEvent());

      case Loading.routeName:
        return MaterialPageRoute(builder: (_) =>Loading());

      case HostEventPage.routeName:
        var args = routeSettings.arguments as Map;
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => HostEventPage(id: args['id']));

      case OthersEventPage.routeName:
        var args = routeSettings.arguments as Map;
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => OthersEventPage(id: args['id']));
      default:
        return null;
    }
  }
}
