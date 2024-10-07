import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:dealdash/feature/home/presentation/widget/sliver_grid_widget.dart';
import 'package:flutter/material.dart';

class ListTopOfferAddisDetailsWidget extends StatelessWidget {
final CategoryData categoryModel;

 const ListTopOfferAddisDetailsWidget({super.key, required this.categoryModel, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            floating: true,
            toolbarHeight: 35,
            title: Text(categoryModel.name),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 5,
            ),
          ),
          SliverGridWidget(categoryModel: categoryModel,)
        ],
      ),
    );
  }
}
