import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreName extends StatelessWidget {
  const StoreName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: ColorManager.primary,
      ),
    );
  }
}
