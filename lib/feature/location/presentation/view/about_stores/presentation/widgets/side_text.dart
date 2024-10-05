import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideText extends StatelessWidget {
  const SideText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style:  TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15.sp,
      ),
    );
  }
}
