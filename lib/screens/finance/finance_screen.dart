import 'package:flutter/material.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({Key? key}) : super(key: key);

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Color(0x00fBFC0CD),
            child: Text('Annen'),
          ),
          SizedBox(height: 50),
          Container(
            color: Color(0x00fBFC0CD),
            height: 150,
          ),
        ],
      ),
    );
  }
}
