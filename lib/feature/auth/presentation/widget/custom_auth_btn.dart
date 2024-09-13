
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn({
    required this.onPressed,
    super.key,
    required this.label,
  });
  final void Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed!,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: ColorManager.red,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(label),
    );
  }
}