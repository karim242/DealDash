import 'package:dealdash/feature/home/presentation/widget/sliver_grid_widget.dart';
import 'package:flutter/material.dart';

class ListTopOfferAddisDetailsWidget extends StatelessWidget {
  // final int index;
List list;
//اما يختار  عروض اديدس يفتح معاه الملابس
//اما يختار الحلويات  عروض يفتح معاه محلات الحلويات
//اما يختار فاليوه  يفتح معاه الاجهزة و الموبيلات

  ListTopOfferAddisDetailsWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            toolbarHeight: 35,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 5,
            ),
          ),
          SliverGridWidget(list: list,)
        ],
      ),
    );
  }
}
