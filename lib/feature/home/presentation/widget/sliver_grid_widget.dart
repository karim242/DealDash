import 'package:flutter/material.dart';

import '../control/product_model.dart';
import '../../data/data.dart';
import 'item_of_list_bottom_widget.dart';
class SliverGridWidget extends StatelessWidget {
  SliverGridWidget({super.key, required this.list});
  late  List list;
  @override
  Widget build(BuildContext context) {
    List<ProductModel> productListModel = productList.expand((x) => x).toList();
    if(list is List<List<ProductModel>>){
      list=list.expand((x) => x).toList();
    }
    return  SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 12,
          childAspectRatio: 1 / 1.3,
        ),
        itemCount:  list.length,
        itemBuilder: (BuildContext context, int index) {
          return  Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ItemOfListBottomWidget(productModel:list[index]));
        }
    );
  }
}
