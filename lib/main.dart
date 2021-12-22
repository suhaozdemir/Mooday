import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/models/todo/task_data.dart';
import 'package:mooday/screens/home_screen.dart';
import 'package:mooday/screens/mood/mood_screen.dart';
import 'services/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(//DevicePreview(
      //   builder: (context) => Mooday(), // Wrap your app
      //   enabled: !kReleaseMode,
      // ));
      Mooday());
}

class Mooday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        // useInheritedMediaQuery: true, // Set to true
        // locale: DevicePreview.locale(context),
        // home: MoodScreen(),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: ROUTE_HOME,
      ),
    );
  }
}
