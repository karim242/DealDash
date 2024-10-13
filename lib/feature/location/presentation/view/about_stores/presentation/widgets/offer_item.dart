import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/core/resources/routes_manger/routes_manager.dart';
import 'package:dealdash/feature/search/data/model/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({
    super.key,
    required this.offers,
  });
  final Offer offers;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         GoRouter.of(context).push(Routes.productDetails, extra: offers);
      },
      child: Card(

        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(
              height: MediaQuery.of(context).size.height * .22,
              width: double.infinity,
              child: Image.network(
                offers.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
                    padding: const EdgeInsets.only(left: 8.0).r,
              child: Text(
                offers.name,
                 maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: ColorManager.primary),
              ),
            ),
            SizedBox(height: 6.h),
            Expanded(
              child: Padding(
                    padding: const EdgeInsets.only(left: 8.0).r,
                child: Row(
                  children: [
                    Text(
                      offers.price.toString(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.4),
                        // decoration:
                        //     TextDecoration.lineThrough,
                        //   decorationColor: Colors.grey, // Set decoration color
                        decorationThickness: 2, // Se
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "30% Off",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.red,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
