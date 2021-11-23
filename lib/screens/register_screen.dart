import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/widgets/round_button.dart';
import 'package:mooday/widgets/floating_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ktitleText,
            style: ktitleStyle.copyWith(fontSize: 40.0),
          ),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: kTextFileDecoration,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                        hintText: 'Enter your password')),
              ],
            ),
          ),
          Hero(
            tag: 'hero-button',
            child: RoundButton(
                color: Colors.black,
                textColor: Colors.white,
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, loginRoute);
                }),
          ),
        ],
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
