import 'package:flutter/material.dart';

class SideText extends StatelessWidget {
  const SideText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
    );
  }
}
