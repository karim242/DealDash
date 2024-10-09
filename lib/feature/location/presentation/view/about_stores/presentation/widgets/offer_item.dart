
import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/feature/search/data/model/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({
    super.key,
    required this.offers,
  });
  final Offer offers;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            offers.image
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          offers.name,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: ColorManager.primary),
        ),
        SizedBox(height: 6.h),
     
        Expanded(
          child: Row(
            
            children: [
              Text(
                offers.price.toString(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.4),
                  // decoration:
                  //     TextDecoration.lineThrough, 
                  //   decorationColor: Colors.grey, // Set decoration color
                  decorationThickness: 2, // Se
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "30% Off",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.red,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}