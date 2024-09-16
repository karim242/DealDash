import 'package:flutter/material.dart';

import '../control/product_model.dart';
import '../data/data.dart';
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
          childAspectRatio: 1 / 1.2,
        ),
        itemCount:  list.length,
        itemBuilder: (BuildContext context, int index) {
          return  ItemOfListBottomWidget(productModel:list[index]);
        }
    );
  }
}
