import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/widgets/round_button.dart';
import 'package:mooday/widgets/floating_button.dart';
import 'package:mooday/services/firebase/auth.dart';
import 'package:mooday/services/firebase/database.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthService _authService = AuthService();
  DatabaseService _databaseService = DatabaseService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            TEXT_TITLE,
            style: STYLE_TITLE.copyWith(fontSize: 40.0),
          ),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: DECORATION_TEXT_FILE,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: DECORATION_TEXT_FILE.copyWith(
                      hintText: 'Enter your password'),
                ),
              ],
            ),
          ),
          Hero(
            tag: 'hero-button',
            child: RoundButton(
              color: Colors.black,
              textColor: Colors.white,
              title: 'Register',
              onPressed: () async {
                try {
                  var user = await _authService.createUser(
                      _emailController.text, _passwordController.text);
                  if (user != null) {
                    _databaseService.addUser(_emailController.text, user.uid);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SNACKBAR_RSUCCESS);
                    Navigator.pushNamed(context, ROUTE_HOME);
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SNACKBAR_ERROR);
                }
              },
            ),
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
