import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/widgets/category_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/color_manger/color_manager.dart';

class RateSection extends StatelessWidget {
  const RateSection({super.key, required this.rateNumber, required this.peopleRatedNum});

  final double rateNumber;
  final int peopleRatedNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 65.w,
          padding:  EdgeInsetsDirectional.symmetric(vertical: 4.h),
          decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                "$rateNumber",
                style:  TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: Colors.white
                ),
              ),
               SizedBox(width: 4.w),
              Icon(Icons.star, color: ColorManager.yellow,size: 15.w,)
            ],
          ),
        ),
         SizedBox(width: 8.w),
        CategoryText(category: peopleRatedNum >= 100 ? "+99 People Rated" : "$peopleRatedNum People Rated"),
      ],
    );
  }
}
