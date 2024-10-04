import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart';
import 'category_widget.dart';

class ListViewCategoryWidget extends StatelessWidget {
  const ListViewCategoryWidget({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: 8),
      scrollDirection: Axis.horizontal,
      itemCount: categoryModel.data.length,
      itemBuilder: (c, i) {
        return CategoryWidget(
          category: categoryModel.data[i],
        );
      },
    );
  }
}
