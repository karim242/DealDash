import 'package:dealdash/feature/about_stores/presentation/widgets/category_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';

class RateSection extends StatelessWidget {
  const RateSection({super.key, required this.rateNumber, required this.peopleRatedNum});

  final double rateNumber;
  final int peopleRatedNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 65,
          padding: const EdgeInsetsDirectional.symmetric(vertical: 4),
          decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                "$rateNumber",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.white
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.star, color: ColorManager.yellow,size: 15,)
            ],
          ),
        ),
        const SizedBox(width: 8),
        CategoryText(category: peopleRatedNum >= 100 ? "+99 People Rated" : "$peopleRatedNum People Rated"),
      ],
    );
  }
}
