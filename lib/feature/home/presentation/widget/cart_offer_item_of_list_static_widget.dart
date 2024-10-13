

import 'package:dealdash/core/resources/routes_manger/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';
import '../control/product_model.dart';

class CardOfferItemOfListStaticDataWidget extends StatelessWidget {
  const CardOfferItemOfListStaticDataWidget({
    super.key,
    required this.productModel,
  });

  // final StoreInCategory? offerData;
  final ProductModel? productModel;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
   onTap:(){
      // navigate to product de and ProductDetails
     GoRouter.of(context).push(Routes.productStaticDetails, extra: productModel);

     },
      child: Card(
        elevation: 2,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                SizedBox(
                  height: MediaQuery.of(context).size.height * .22,
                  width: double.infinity,
                  child: Image.asset(
                    productModel?.imagePath ?? '',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                //title
                Padding(
                  padding: const EdgeInsets.only(left: 8.0).r,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    productModel?.title ?? AppStrings.appelMob,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Row(
                    children: [
                      FittedBox(
                          fit: BoxFit.scaleDown,
                          child:  Padding(
                            padding: const EdgeInsets.only(left: 8.0).r,
                            child: Text(
                              "${productModel!.newPrice} E",
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorManager.primary,
                              ),
                            ),
                          )),
                      Text(
                        "30% Off",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.red,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              top: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorManager.whitGreen,
                ),
                child: Row(
                  children: [
                    Text(
                      "3.5",
                      style: TextStyle(
                        color: ColorManager.primary,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.yellow,
                    )
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
