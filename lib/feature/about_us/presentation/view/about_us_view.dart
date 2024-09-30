import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/custom_appbar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "About Us"),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w,vertical: 16.h),
        child: SingleChildScrollView(
          child: Text(
            '''Welcome to DealDash app, your ultimate guide to discovering the best deals and offers around you! Using your current location, our app helps you find nearby places offering amazing discounts, promotions, and special offers, all within your region.

Whether you're looking for restaurants, stores, or entertainment venues, DealDash ensures you're never missing out on the latest deals near you.

Features:

Real-time location-based offers
Explore deals from various categories
Save your favorite offers for later
Stay updated with notifications about new discounts in your area
Enjoy smart savings with DealDash – your go-to app for local deals!''',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorManager.primary
            ),
          ),
        ),
      ),
    );
  }
}
