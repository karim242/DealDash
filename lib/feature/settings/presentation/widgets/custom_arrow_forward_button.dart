import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';

class CustomArrowForwardButton extends StatelessWidget {
  const CustomArrowForwardButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap, icon:  Icon(Icons.arrow_forward_ios,color: Colors.black.withOpacity(0.2)));
  }
}
