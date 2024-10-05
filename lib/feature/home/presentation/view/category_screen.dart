import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:dealdash/feature/home/presentation/widget/list_top_offer_addis_details_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Categories"),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: GridView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1 / 1.2,
              ),
              itemCount: category.data.length,
              itemBuilder: (context, index) {
                return CustomCategoryCard(
                    category: category.data[index]);
              },
            )),
      ),
    );
  }
}

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({
    super.key,
    required this.category,
  });

  final CategoryData category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ListTopOfferAddisDetailsWidget(
                      categoryModel: category,
                    )));
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 2.3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    category.image,
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
                width: MediaQuery.sizeOf(context).width / 2.3,
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
