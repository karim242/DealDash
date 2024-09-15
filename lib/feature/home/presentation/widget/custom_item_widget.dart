import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/resources/image_manger/image_manger.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';
class CustomItemWidget extends StatelessWidget {
  const CustomItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
                padding: const EdgeInsets.all(4),
                color: Colors.white,
                child: const Icon(Icons.favorite_border)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .09,
            width: double.infinity,
            child: Image.asset(
              ImageManger.imageMobil2,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("3.5"),
                Icon(
                  Icons.star,
                  color: ColorManager.green,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              AppStrings.appelMob,
              textDirection: TextDirection.rtl,
            ),
          )
        ],
      ),
    );
  }
}
