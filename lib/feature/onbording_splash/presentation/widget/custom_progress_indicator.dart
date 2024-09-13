
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int currentPage;
final void Function()? onTap;
  const CustomProgressIndicator({super.key, required this.currentPage,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              value: (currentPage + 1) / 3,  // يتغير بناءً على الصفحة الحالية
              strokeWidth: 5,
              valueColor:  AlwaysStoppedAnimation<Color>(ColorManager.red,),
              backgroundColor: ColorManager.whitGreen,
            ),
          ),
           Icon(
            Icons.arrow_forward,
            color: ColorManager.red,
            size: 30,
          ),
        ],
      ),
    );
  }
}