import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mooday/widgets/floating_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    animation = ColorTween(begin: Colors.black38, end: Colors.white)
        .animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Hero(
                tag: 'hero-title',
                child: Text(
                  TEXT_TITLE,
                  style: STYLE_TITLE,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                TEXT_SUBTITLE,
                style: STYLE_SUBTITLE,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    TEXT_SUBTITLE_2,
                    textStyle: STYLE_SUBTITLE_2,
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/selfie.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
        scale: 1.7,
        title: 'Start',
        onPressed: () {
          Navigator.pushNamed(context, ROUTE_LANDING_AFTER);
          if (_auth.currentUser != null) {
            Navigator.pushNamed(context, ROUTE_HOME);
          }
        },
      ),
    );
  }
}
