import 'package:flutter/material.dart';
import 'package:mooday/models/finance/load_finance_screen.dart';
import 'package:mooday/screens/finance/finance_screen.dart';
import 'package:mooday/screens/landing_screen.dart';
import 'package:mooday/screens/landingafter_screen.dart';
import 'package:mooday/screens/home_screen.dart';
import 'package:mooday/screens/notes/notes_screen.dart';
import 'package:mooday/screens/register_screen.dart';
import 'package:mooday/screens/sign_screen.dart';
import 'package:mooday/screens/mood/mood_screen.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/screens/timer/timer_screen.dart';
import 'package:mooday/screens/todo/todo_screen.dart';
import 'package:mooday/screens/weather/load_weather_screen.dart';
import 'package:mooday/screens/weather/weather_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_LANDING:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case ROUTE_LANDING_AFTER:
        return MaterialPageRoute(builder: (_) => const LandingAfterScreen());
      case ROUTE_LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case ROUTE_REGISTER:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case ROUTE_MOOD:
        return MaterialPageRoute(builder: (_) => MoodScreen());
      case ROUTE_TIMER:
        return MaterialPageRoute(builder: (_) => TimerScreen());
      case ROUTE_TODO:
        return MaterialPageRoute(builder: (_) => const TodoScreen());
      case ROUTE_NOTES:
        return MaterialPageRoute(builder: (_) => const NotesScreen());
      case ROUTE_WEATHER:
        return MaterialPageRoute(builder: (_) => WeatherScreen());
      case ROUTE_LOAD_WEATHER:
        return MaterialPageRoute(builder: (_) => const LoadWeatherScreen());
      case ROUTE_FINANCE:
        return MaterialPageRoute(builder: (_) => FinanceScreen());
      case ROUTE_LOAD_FINANCE:
        return MaterialPageRoute(builder: (_) => const LoadFinanceScreen());
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
