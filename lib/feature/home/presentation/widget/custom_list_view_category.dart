import 'package:flutter/material.dart';
import '../control/home_view_model.dart';
import '../data/data.dart';
import 'category_widget.dart';

class ListViewCategoryWidget extends StatelessWidget {
  const ListViewCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: HomeViewModel.listCategory.length,
      itemBuilder: (c, i) {
        return CategoryWidget(
          categoryModel: HomeViewModel.listCategory[i],
          list: productList[i],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 8,
      ),
    );
  }
}
