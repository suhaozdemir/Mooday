import 'package:flutter/material.dart';

class StartChild extends StatelessWidget {
  StartChild({required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: const Alignment(0.0, -0.50),
        child: Text(
          date,
          style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
