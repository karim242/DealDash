<<<<<<< HEAD
import 'package:dealdash/feature/home/presentation/view/category_screen.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/routes_manger/routes_manager.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';
import '../control/category_model.dart';
import '../data/data.dart';
import '../widget/all_category_widget.dart';
import '../widget/category_widget.dart';
import '../widget/custom_baner.dart';
import '../widget/custom_list_view_category.dart';
import '../widget/custom_search_form.dart';
import '../widget/list_top_offer_Addis_widget.dart';
import '../widget/list_top_offer_addis_details_widget.dart';
import '../widget/sliver_grid_widget.dart';
import '../widget/text_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        //form search
        SliverAppBar(
          flexibleSpace: const CustomSearchForm(),
          toolbarHeight: h * .12,
          floating: true,
        ),
        //promo code
        SliverToBoxAdapter(child: CustomBaner(height: h)),
        SliverToBoxAdapter(child: SizedBox(height: h * .02)),
        //page view offer
        const SliverToBoxAdapter(
          child: ListTopOfferAddisWidget(),
        ),
        SliverToBoxAdapter(child: SizedBox(height: h * .02)),
        //What are you looking for
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextWidget(
              title: AppStrings.whatYouWantText,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: h * .02)),
        //Category super market
        SliverToBoxAdapter(
          child: Row(
            children: [
              const AllCategoryWidget(),
              Expanded(
                  child:
                      SizedBox(height: 100, child: ListViewCategoryWidget(list: listCategory,),),),
            ],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: h * .02)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextWidget(
              title: AppStrings.suggestedForYou,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: h * .01)),
        //list bottom
        SliverGridWidget(
          list: productList,
        ),

      ],
    );
  }
}

