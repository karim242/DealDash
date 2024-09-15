import 'package:flutter/material.dart';

import '../widget/custom_baner.dart';
import '../widget/custom_div_what_you_want_widget.dart';
import '../widget/custom_item_widget.dart';
import '../widget/custom_search_form.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        //form search
        const SliverToBoxAdapter(child: CustomSearchForm()),
        //page view value addidas
        SliverToBoxAdapter(child: CustomBaner(height: h)),
        SliverToBoxAdapter(child: SizedBox(height: h * .01)),
        SliverToBoxAdapter(
            child: CustomDivWhatYouWantWidget(
          height: h,
          width: w,
        )),
        //  List  offer
        SliverToBoxAdapter(
            child: ElevatedButton(
                onPressed: () {
                  print("CustomItemWidget".toLowerCase());
                },
                child: Text("data"))),
        SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: w / h + .2,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) =>
              const CustomItemWidget(),
        ),
      ],
    );
  }
}
