import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/widgets/floating_button.dart';
import 'package:mooday/widgets/round_button.dart';

class LandingAfterScreen extends StatefulWidget {
  const LandingAfterScreen({Key? key}) : super(key: key);

  @override
  _LandingAfterScreenState createState() => _LandingAfterScreenState();
}

class _LandingAfterScreenState extends State<LandingAfterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'hero-title',
              child: Text(
                ktitleText,
                style: ktitleStyle.copyWith(fontSize: 40.0),
              ),
            ),
            const SizedBox(height: 40.0),
            Hero(
              tag: 'hero-button',
              child: RoundButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  title: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, loginRoute);
                  }),
            ),
            RoundButton(
                color: Colors.white,
                textColor: Colors.black,
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, registerRoute);
                })
          ],
        ),
      ),
      floatingActionButton: FloatingButton(
        scale: 1.2,
        title: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
