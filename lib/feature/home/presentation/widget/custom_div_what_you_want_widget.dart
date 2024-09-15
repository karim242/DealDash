import 'package:flutter/material.dart';

import '../../../../core/resources/strings_manger/strings_manager.dart';
import 'custom_list_view_category.dart';
import 'custom_offer_auto_page_view.dart';
import 'custom_what_you_want_text.dart';
class CustomDivWhatYouWantWidget extends StatelessWidget {
  final  double height;
  final double width;
  const CustomDivWhatYouWantWidget({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          //valu addidas
          SizedBox(
            height: height * .2,
            child: const CustomOfferAutoPageView(),
          ),
          SizedBox(height: height * .01),
          CustomWhatYouWantText(
            title: AppStrings.whatYouWantText,
          ),
          SizedBox(height: height * .01),
          const SizedBox(height: 100, child: CustomListViewCategory()),
          CustomWhatYouWantText(
            title: AppStrings.suggestedForYou,
          ),
        ],
      ),
    );
  }
}
