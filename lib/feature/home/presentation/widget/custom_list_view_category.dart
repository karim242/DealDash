import 'package:flutter/material.dart';

import '../control/home_view_model.dart';
import 'custom_category.dart';
class CustomListViewCategory extends StatelessWidget {
  const CustomListViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      reverse:true,
      scrollDirection: Axis.horizontal,
      itemCount: HomeViewModel.listCategory.length,
      itemBuilder: (c, i) {
        return CustomCategory(categoryModel: HomeViewModel.listCategory[i]);
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 8,
      ),
    );
  }
}
