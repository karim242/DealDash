import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/image_manger/image_manger.dart';
import '../control/home_view_model.dart';
import '../widget/custom_baner.dart';
import '../widget/custom_category.dart';
import '../widget/custom_offer_auto_page_view.dart';
import '../widget/custom_search_form.dart';
import '../widget/custom_what_you_want_text.dart';

class HomeView extends StatelessWidget {
  HomeViewModel? homeViewModel;
  HomeView({super.key, this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
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
              const CustomWhatYouWantText(),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeViewModel!.listCategory.length,
                  itemBuilder: (c, i) {
                    if (homeViewModel != null) {
                      return CustomCategory(
                        title: homeViewModel!.listCategory[0].title ?? "",
                        image: homeViewModel!.listCategory[0].image ?? "",
                      );
                    } else {
                      return const Text("ERROR");
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 8,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
