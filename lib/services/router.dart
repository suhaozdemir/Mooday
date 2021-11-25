import 'package:flutter/material.dart';
import 'package:mooday/screens/landing_screen.dart';
import 'package:mooday/screens/landingafter_screen.dart';
import 'package:mooday/screens/home_screen.dart';
import 'package:mooday/screens/register_screen.dart';
import 'package:mooday/screens/sign_screen.dart';
import 'package:mooday/assets/constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingRoute:
        return MaterialPageRoute(builder: (_) => LandingScreen());
      case landingAfterRoute:
        return MaterialPageRoute(builder: (_) => LandingAfterScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Something Went Wrong'),
            ),
          ),
        );
    }
  }
}
