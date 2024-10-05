import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    return  Text(
      header,
      style:  TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
      ),
    );
  }
}
