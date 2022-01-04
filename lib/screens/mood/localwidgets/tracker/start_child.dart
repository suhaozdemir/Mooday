import 'package:flutter/material.dart';

class StartChild extends StatelessWidget {
  const StartChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: const Alignment(0.0, -0.50),
        child: const Text(
          '04/01/2022',
          style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
