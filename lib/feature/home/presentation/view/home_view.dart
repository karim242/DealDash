import 'package:dealdash/feature/home/presentation/control/category/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings_manger/strings_manager.dart';
import '../../../../core/services/service_locator.dart';
import '../../data/data.dart';
import '../widget/all_category_widget.dart';
import '../widget/custom_baner.dart';
import '../widget/custom_list_view_category.dart';
import '../widget/custom_search_form.dart';
import '../widget/list_top_offer_Addis_widget.dart';
import '../widget/sliver_grid_widget.dart';
import '../widget/text_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          //form search
          SliverAppBar(
            automaticallyImplyLeading: false,
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
                  child: SizedBox(
                    height: 100,
                    child: ListViewCategoryWidget(
                      list: listCategory,
                    ),
                  ),
                ),
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
      ),
    );
  }
}
