import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'services/router.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Mooday());
}

class Mooday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: landingRoute,
    );
  }
}
