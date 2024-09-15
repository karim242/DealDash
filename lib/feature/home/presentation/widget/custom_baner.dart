import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/resources/font_manger/font_manager.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';

class CustomBaner extends StatelessWidget {
  const CustomBaner({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, M);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.centerRight,
        color: ColorManager.green,
        height: height * .04,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "اعرف اكتر...",
                textDirection: TextDirection.rtl,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 12),
              ),
            ),
            Expanded(
              flex: 4,
              child: RichText(
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppStrings.customBanerOfferText,
                    ),
                    TextSpan(
                      text: AppStrings.customBanerOneHPText,
                      style: const TextStyle(
                          backgroundColor: Colors.yellow, height: 1.9),
                    ),
                    TextSpan(
                      text: AppStrings.customBanerPromoCodeText,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBanerDetails extends StatelessWidget {
  const CustomBanerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(AppStrings.nameProject),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back))
          ],
        )
      ],
    );
  }
}
