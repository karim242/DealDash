import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/resources/image_manger/image_manger.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';
import '../widget/custom_baner.dart';
import '../widget/custom_list_view_category.dart';
import '../widget/custom_offer_auto_page_view.dart';
import '../widget/custom_search_form.dart';
import '../widget/custom_what_you_want_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: h * .05),
          const CustomSearchForm(),
          SizedBox(height: h * .01),
          CustomBaner(height: h),
          SizedBox(height: h * .01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                SizedBox(
                  height: h * .28,
                  child: const CustomOfferAutoPageView(),
                ),
                SizedBox(height: h * .01),
                CustomWhatYouWantText(
                  title: AppStrings.whatYouWantText,
                ),
                SizedBox(height: h * .01),
                const SizedBox(height: 100, child: CustomListViewCategory()),
                CustomWhatYouWantText(
                  title: AppStrings.suggestedForYou,
                ),
                SizedBox(
                  height: h*.5,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,),
                    itemCount: 50,
                 itemBuilder:(_,index){
                      return   const CustomItem();
                 } ,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class CustomItem extends StatelessWidget {
  const CustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
                padding: const EdgeInsets.all(4),
                color: Colors.white,
                child: const Icon(Icons.favorite_border)),
          ),
          Container(
            height: 60,

            width: double.infinity,
            child: Image.asset(
              ImageManger.imageMobil2,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("3.5"),
                Icon(
                  Icons.star,
                  color: ColorManager.green,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(AppStrings.appelMob,
              textDirection: TextDirection.rtl,
            ),
          )

        ],
      ),

    );
  }
}
