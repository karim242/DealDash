import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/color_manger/color_manager.dart';

class StoreIconButtons extends StatelessWidget {
  const StoreIconButtons({super.key, required this.iconData, required this.onTap});

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorManager.primary,
      radius: 25.w,
      child: IconButton(onPressed:onTap, icon: Icon(iconData,color: ColorManager.red,)),
    );
  }
}
