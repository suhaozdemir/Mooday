import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'services/router.dart';

void main() {
  runApp(Mooday());
}

class Mooday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: landingRoute,
    );
  }
}
