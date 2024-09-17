import 'package:flutter/material.dart';
import '../data/data.dart';
import 'category_widget.dart';

class ListViewCategoryWidget extends StatelessWidget {
   const ListViewCategoryWidget({super.key, required this.list});
  final List list;

  @override
  Widget build(BuildContext context) {


    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 8),
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (c, i) {
        return CategoryWidget(
          categoryModel: list[i],
          list: productList[i],
        );
      },
    );
  }
}
