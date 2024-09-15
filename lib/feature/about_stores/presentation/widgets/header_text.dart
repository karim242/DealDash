import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    return  Text(
      header,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }
}
