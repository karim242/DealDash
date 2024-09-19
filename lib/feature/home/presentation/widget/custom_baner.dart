import 'dart:async';

import 'package:dealdash/feature/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/resources/font_manger/font_manager.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';
import 'custom_search_form.dart';

class CustomBaner extends StatelessWidget {
  const CustomBaner({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: AlignmentDirectional.centerStart,
      color: ColorManager.green,
      height: height * .05,
      width: double.infinity,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              style: Theme.of(context).textTheme.titleMedium,
              text: AppStrings.customBanerOfferText,
            ),
            TextSpan(
              text: AppStrings.customBanerOneHPText,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(backgroundColor: Colors.yellow),
            ),
            TextSpan(
              style: Theme.of(context).textTheme.titleMedium,
              text: AppStrings.customBanerPromoCodeText,
            ),
          ],
        ),
      ),
    );
  }
}

/*
            Expanded(
              child: Text(
                AppStrings.readMore,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 12),
              ),
            ),

 */
