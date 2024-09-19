import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../data/data.dart';
import '../view/category_screen.dart';
class AllCategoryWidget extends StatelessWidget {
  const AllCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CategoryScreen(
                  list: listCategory,
                )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width * .3,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Icon(Icons.view_cozy, color: ColorManager.primary, size: 60),
            Text(
              "All Category",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
