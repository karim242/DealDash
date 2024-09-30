import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:dealdash/feature/home/presentation/control/category/category_cubit.dart';
import 'package:dealdash/feature/home/presentation/control/category/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color_manger/color_manager.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Categories"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CategorySuccess) {
                final list = state.categoryModel;
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return CustomCategoryCard(category: state.categoryModel[index]);
                  },
                );
              } else if (state is CategoryError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const Center(child: Text('No categories available.'));
              }
            },
          ),
        ),
      ),
    );
  }
}
class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (_) => ListTopOfferAddisDetailsWidget(
        //               list: productList[i],
        //             )));
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width/2.3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    category.imageUrl,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: ColorManager.whitGreen,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    )),
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width/2.3,
                padding: const EdgeInsets.all(4),
                child: Text(
                  category.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
