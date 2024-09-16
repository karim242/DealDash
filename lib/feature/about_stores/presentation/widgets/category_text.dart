import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manger/color_manager.dart';

class CategoryText extends StatelessWidget {
  const CategoryText({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return  Text(
      category,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: ColorManager.primary.withOpacity(0.7),
      ),
    );
  }
}
