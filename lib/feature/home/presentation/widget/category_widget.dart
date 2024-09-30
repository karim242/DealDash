import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/feature/home/presentation/control/category_static_model.dart';
import 'package:flutter/material.dart';

import 'list_top_offer_addis_details_widget.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryStaticModel categoryModel;
  final List list;

  const CategoryWidget({super.key, required this.categoryModel, required this.list});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
    
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListTopOfferAddisDetailsWidget(
                      list: list,
                    )));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                categoryModel.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              width: 100,
              color: ColorManager.whitGreen,
              child: Text(
                categoryModel.title,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
