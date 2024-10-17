
import 'package:dealdash/feature/home/logic/category/category_cubit.dart';
import 'package:dealdash/feature/home/logic/category/category_state.dart';
import 'package:dealdash/feature/home/presentation/widget/all_category_widget.dart';
import 'package:dealdash/feature/home/presentation/widget/custom_list_view_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      if (state is CategoryLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is CategorySuccess) {
        final categoryModel = state.categoryModel;
        return Row(
          children: [
            AllCategoryWidget(
              category: categoryModel,
            ),
            Expanded(
              child: SizedBox(
                height: 100,
                child: ListViewCategoryWidget(
                  categoryModel: categoryModel,
                ),
              ),
            ),
          ],
        );
      } else if (state is CategoryError) {
        return Center(child: Text('Error: ${state.message}'));
      } else {
        return const Center(child: Text('No categories available.'));
      }
    });
  }
}