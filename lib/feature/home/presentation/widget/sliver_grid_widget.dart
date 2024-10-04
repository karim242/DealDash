import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:flutter/material.dart';

import '../control/product_model.dart';
import '../../data/data.dart';
import 'item_of_list_bottom_widget.dart';
class SliverGridWidget extends StatelessWidget {
   const SliverGridWidget({super.key, required this.categoryModel});
   final CategoryData categoryModel;
  @override
  Widget build(BuildContext context) {

    return  SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 12,
          childAspectRatio: 1 / 1.3,
        ),
        itemCount:  categoryModel.stores.length,
        itemBuilder: (BuildContext context, int index) {
          return  ItemOfListBottomWidget(store:categoryModel.stores[index]);
        }
    );
  }
}
