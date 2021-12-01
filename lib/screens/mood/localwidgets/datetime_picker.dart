import 'package:flutter/material.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker(
      {Key? key,
      required this.pickedDate,
      required this.icon,
      required this.onPressed,
      required this.time})
      : super(key: key);

  final IconData icon;
  final DateTime pickedDate;
  final VoidCallback onPressed;
  final String time;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(icon),
      label: Text(time),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(50.0, 50.0),
        primary: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
