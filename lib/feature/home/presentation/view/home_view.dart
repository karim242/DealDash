import 'package:dealdash/core/check_connect_internet/cubit/connect_internet_cubit.dart';
import 'package:dealdash/core/check_connect_internet/cubit/connect_internet_state.dart';
import 'package:dealdash/core/widget/ui_not_connectinternet_widget.dart';
import 'package:dealdash/feature/home/presentation/widget/category_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings_manger/strings_manager.dart';
import '../widget/custom_baner.dart';
import '../widget/custom_search_form.dart';
import '../widget/list_top_offer_Addis_widget.dart';
import '../widget/text_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;
    return BlocBuilder<ConnectInternetCubit, ConnectInternetState>(
      builder: (context, state) {
        if (state is NotConnectedState) {
          return const UINotConnectInterNetWidget();
        }
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
              const SliverToBoxAdapter(
                child: CategoryRow(),
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
              // SliverGridWidget(categoryModel: null,

              // ),
            ],
          ),
        );
      },
    );
  }
}
