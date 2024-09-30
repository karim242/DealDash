import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItemText extends StatelessWidget {
  const SettingItemText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}
