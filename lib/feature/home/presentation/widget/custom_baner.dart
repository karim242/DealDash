import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/resources/font_manger/font_manager.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';
class CustomBaner extends StatelessWidget {
  const CustomBaner({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerRight,
      color: ColorManager.green,
      height: height * .06,
      width: double.infinity,
      child: RichText(
        textDirection: TextDirection.rtl,

        text: TextSpan(
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: FontConstants.sultan),
          children:  <TextSpan>[
            TextSpan(
              text: AppStrings.customBanerOfferText,
            ),
            TextSpan(
              text: AppStrings.customBanerOfferText,
              style: const TextStyle(backgroundColor: Colors.yellow,  ),
            ),
            TextSpan(
              text: AppStrings.customBanerPromoCodeText,

            ),
          ],
        ),
      ),
    );
  }
}
