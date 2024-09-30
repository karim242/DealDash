import 'package:dealdash/core/services/service_locator.dart';
import 'package:dealdash/feature/home/presentation/control/category/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../data/data.dart';
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
                builder: (_) => BlocProvider(
                        create: (context) => sl<CategoryCubit>()..fetchCategories(),
                      child: CategoryScreen(),
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width * .3,
        height: MediaQuery.of(context).size.width * .28,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
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
