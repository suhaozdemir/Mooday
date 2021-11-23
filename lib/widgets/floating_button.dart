import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton(
      {required this.scale, required this.title, required this.onPressed});

  final double scale;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
        child: FloatingActionButton(
          child: Text(title),
          onPressed: onPressed,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
